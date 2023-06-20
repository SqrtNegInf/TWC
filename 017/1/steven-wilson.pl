#!/usr/bin/env perl
use v5.36;
no warnings 'recursion';

use Memoize;
use Test::More;

ok( A( 1, 2 ) == 4, 'Test A(1, 2) == 4' );

done_testing();

# This gets past A(4,1) quicker but A(4,2) takes too long so don't run this script
memoize("A");

sub A {
    my ( $m, $n ) = @_;
    if ( $m == 0 ) {
        return $n + 1;
    }
    elsif ( $m > 0 and $n == 0 ) {
        return A( $m - 1, 1 );
    }
    elsif ( $m > 0 and $n > 0 ) {
        return A( $m - 1, A( $m, $n - 1 ) );
    }
}

my $number = 3;
for my $n ( 0 .. $number ) {
    for my $m ( 0 .. $number ) {
        say "A($m, $n) is ".  A( $m, $n );
    }
}
