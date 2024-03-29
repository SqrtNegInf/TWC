#!/usr/bin/env perl
use v5.36;
no warnings 'experimental';  # for smartmatch

use List::Util qw(any sum0);
use Scalar::Util qw(looks_like_number);

my ( $S, @C ) = <6 1 2 4>;

$S //= 6;

@C = ( 1, 2, 4 ) unless @C;

if (   ( any { !looks_like_number( $_ ) } ( $S, @C ) )
    || ( any { $_ < 1 } @C ) )
{
    usage();
    exit 1;
}

my @possible_combinations = possible_combinations( \@C, $S );

say scalar @possible_combinations;

exit 0 unless $ENV{DEBUG};

for my $combination ( @possible_combinations ) {
    say "(" . join( ', ', @$combination ) . ")";
}

exit 0;

sub possible_combinations ( $coins, $sum, $cur = [] ) {
    my $current_sum = sum0 @{$cur};

    return $cur   if $current_sum == $sum;
    die "invalid" if $current_sum > $sum;

    my @solutions;
    for my $coin ( @$coins ) {
        eval {
            my @sub_solutions = possible_combinations( $coins, $sum, [ @$cur, $coin ] );
            push @solutions, map {
                [ sort { $a <=> $b } @$_ ]
            } @sub_solutions;
        };

        die $@ if $@ and $@ !~ /invalid/;
    }

    return unique_combinations( @solutions );
}

sub unique_combinations(@list) {
    my @out;

    for my $item ( @list ) {
        my $found = 0;
        for my $check ( @out ) {
            if ( @$check ~~ @$item ) {
                $found = 1;
                last;
            }
        }
        push @out, $item unless $found;
    }

    return @out;
}

sub usage() {
    say <<END;
$0 <SUM> [COINS]

  <SUM>   the sum that should be created
  [COINS] the set of coins available
END
}
