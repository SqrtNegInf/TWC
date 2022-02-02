#!/usr/bin/env raku
#
#
#       fib-sums.raku
#
#
#
#       © 2022 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN ( $N = 25 ) ;

sub is_fib ( $num ) {
    state @fibs = (0, 1, 1, * + * ... *);
    state %fh;
    state $n = 0;
    while @fibs[$n] < $num  {
        %fh{ @fibs[++$n] } = 1; 
    }

    return %fh{$num}:exists
        ?? 1
        !! 0
}

my  @out = (0, | grep { is_fib( $_.comb.sum ) }, (0..*) )[0..$N-1];
say my $result = @out.join(' ');

use Test;
is $result, '0 1 2 3 5 8 10 11 12 14 17 20 21 23 26 30 32 35 41 44 49 50 53 58 62';
