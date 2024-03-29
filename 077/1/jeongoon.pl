#!/usr/bin/env perl
use v5.36;

use Getopt::Long qw(:config gnu_compat);
use Pod::Usage;
use List::Util qw{product};

BEGIN {
    sub fs { "File::Spec" }
    $::debugging = 0;

    my $help = 0;

    GetOptions( "debug"   => \$::debugging,
                "help"    => \$help,
        ) or pod2usage(2);

    pod2usage( -exitval => 0, -verbose => 2 ) if $help;


    our $dprint = sub {
        ++$|;
        print @_;
    };

    *::dprint = $::debugging ? $dprint : sub {};
}

sub fibs :prototype($) { # excluding first 1 for challenge purpose
    my $limit = shift;
    $limit <= 1 and return (1);
    $limit <= 2 and return (1,2);

    my @fibs = ( 1, 2 );
    while ( (my $new_fib = ($fibs[-2] + $fibs[-1] )) <= $limit ) {
        push @fibs, $new_fib;
    }
    @fibs
}

sub rfibs :prototype($) { reverse (fibs shift) }

# return the all possible ways a fib number can be expressed
#   which includes the fib number itself
# ex) f(55) -> [55], [34, 21], [34, 13, 8], [34, 13, 5, 3], [34, 13, 5, 2, 1]
# return as array of arrayref

sub allCasesSubFibs :prototype($$) {
    # assume allRevFibsRef is sorted desc.
    my ( $afib, $allRevFibsRef )  = @_;
    my @allRevFibs = @{$allRevFibsRef}; # copy: no side effect

    my $skip = 0;
    for my $fi ( 0..$#allRevFibs ) { # FIXME: I saw something new expression
        $allRevFibs[$fi] == $afib and ( $skip = $fi + 1 );
    }
    my @subfibs = splice @allRevFibs, $skip;
    my @allCases = ( [$afib] ); # add fib number itself.
                                # XXX: even if it's already banned.

    for ( my $fi = 0; $fi+1 < @subfibs; $fi += 2 ) {
        my @lastFibs = splice( @{[@{$allCases[-1]}]}, # copy
                               0, $#{$allCases[-1]} );
        my @twoFibs = @subfibs[ $fi, $fi+1 ];
        push @allCases, [ @lastFibs, @twoFibs ];
    }
    @allCases;
}

sub productCases :prototype($$) {
    my ( $casesRef, $validate_code, @pos, $csr ) = @_[0,1];
    my @cases = @{$casesRef}; # side note: this is copy method
    @pos = (0) x scalar @cases;
    if ( @pos == 1 ) {
        ::dprint "[WRN] only one case given\n";
    }
    my @num_cases = map { scalar @{$_} } @cases;
    ::dprint "[INF] total: ".( join " x ", @num_cases  )." = ".
      (product @num_cases)." case(s)\n";

    $csr = $#cases;

    my @allcases;
    {
        if ( $pos[$csr] < @{$cases[$csr]} ) {
            ::dprint "[DBG] $csr: @pos: ",
              (join ",", map { @{$cases[$_][$pos[$_]]} } 0..$#cases ),$/;

            my @current_cases = map { $cases[$_][$pos[$_]] } 0..$#cases;
            $validate_code->( \@current_cases )
              and push @allcases, [ map { @$_ } @current_cases ]; # flatten
            ++$pos[$csr];
            redo;
        }
        else {
            # find higher order case
            my $newCsr;
            for ( my $c = $csr-1; $c >= 0; --$c ) {
                if ( $pos[$c] < $#{$cases[$c]} ) {
                    $newCsr = $c;
                    ::dprint "[DBG] New Cursor: $newCsr\n";
                    last;
                }
            }
            if ( defined $newCsr ) {
                ++$pos[$newCsr];
                @pos[ $newCsr+1 .. $#pos ] = (0) x (scalar @pos);
                $csr = $#cases;
                redo;
            }
        }
    }
    @allcases;
}

# product all cases of each fib numbers
sub productRevFibCombination :prototype($$) {
    my ( $aRevFibCombiRef, $allRevFibsRef ) = @_;

    my @rcases = map {
        my @a = allCasesSubFibs( $_, $allRevFibsRef );
        ::dprint( ('[DBG] ', join "|", map{ "[".join( ",", @$_)."]" } @a), $/ );
        [ @a ];

    } @$aRevFibCombiRef;
    productCases \@rcases, sub { # for $validate_code
        my @cases = @{$_[0]}; # copy
        my $left_case = shift @cases;
        my $overlapped = 0;
        for my $right_case (@cases) {
            $$left_case[-1] <= $$right_case[0] and ( $overlapped = 1, last );
            $left_case = $right_case;
        }
        not $overlapped;
    };
}

sub minRevFibSumCombination :prototype($$);
sub minRevFibSumCombination :prototype($$) { # find a case tally the target sum.
    my ( $targetSum, $allRevFibRef ) = @_;
    #my @allRevFib = grep { $_ <= $targetSum } @{$allRevFibRef};
    my @allRevFib = @{$allRevFibRef}; # assuming it's already sieved.
    my $majorFib;
    {
        $majorFib = shift @allRevFib;
        defined $majorFib or return ();
        ::dprint "[DBG] current major fib: $majorFib, target sum: $targetSum\n";
        redo if $majorFib > $targetSum;

        $majorFib == $targetSum and return ($majorFib);
    }

    my @rest = minRevFibSumCombination( ($targetSum-$majorFib), \@allRevFib );
    ::dprint "[DBG] rest for $majorFib: @rest\n";
    return ( @rest > 0 ? ( $majorFib, @rest ) : () )
}

# final solution form
sub allCombiFibSum :prototype($) {
    my $targetSum = shift;
    my @reversedFibNumbers = rfibs $targetSum;

    my @aCombi = minRevFibSumCombination( $targetSum, \@reversedFibNumbers );
    ::dprint( "[DBG] A possible minimum combination: ", join( ",", @aCombi ), $/ );
    return () if @aCombi == 0;
    productRevFibCombination( \@aCombi, \@reversedFibNumbers );
}

if (0) {
    say "@{[rfibs 999]}";
    say "@$_" for allCasesSubFibs 55, [rfibs(55)];
    say "@$_" for productRevFibCombination ( [89,21,3], [rfibs 55] );
    say "@{[minRevFibSumCombination(150, [rfibs 150])]}";
}

my $N = 377;
( defined $N and $N > 0 ) or pod2usage( -exitval => 0, -verbose => 1 );

say "Input: \$N = $N";
my @allCombi = allCombiFibSum $N;
say "Output:";
say map {
    join( " + ",  @$_ ). " = " . $N . $/;
} @allCombi;
say "Total ".(scalar @allCombi)." case(s) found";
