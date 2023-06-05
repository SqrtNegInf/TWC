#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

# solution
sub combiPrimeSum { # dejavu !
    my $S   = shift;
    my @RPN = ( @_ == 0 ? reverse pnumbers( $S ) : @_ );
    my $fp  = shift @RPN;

    defined $fp or ( warn "no prime number found", return () );

    my @result;
    my $maxNop = int $S / $fp;
    for my $nop ( reverse 0 .. $maxNop ) {
        my $remainer = $S - $fp * $nop;
        my @pnums = ( $fp ) x $nop;
        if ( $remainer > 0 ) {
            next if @RPN == 0;
            push @result, map { [ @pnums, @$_ ] } combiPrimeSum( $remainer, @RPN );
        }
        else { push @result, [ @pnums ] }
    }
    @result;
}

sub pnumbers { # a poor brute forced prime number generator
    my @p = (3);
    my $limit = shift;
    my $candi = 3;
    return [2]   if $limit == 2;
    return [2,3] if $limit <  5;

  NewNumber:
    while ( ($candi += 2) <= $limit ) {
        for my $p (@p) {
            ($candi % $p) or next NewNumber;
        }
        push @p, $candi;
    }
    return 2, @p;
}

# testing
package main;

sub usage {
    say "perl ch-1.pl <sum>";
}
sub raku_array { "[".(join ", ", @_)."]" }

#scalar @ARGV != 1 and ( usage, exit -1 );

my $N = 51;
my @combi = combiPrimeSum( $N );

say "Input: \$N = $N";

say "Output: " . min( map { scalar @$_ } @combi );
#say "possible ways are:";
#say "@{[raku_array @$_ ]}" for @combi;
