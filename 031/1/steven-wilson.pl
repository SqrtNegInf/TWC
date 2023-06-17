#!/usr/bin/env perl
use v5.36;

use Test::More;

ok( is_divide_by_zero( 1, 0 ) == 1, "Test zero denominator" );
ok( is_divide_by_zero( 1, 1 ) == 0, "Test non-zero denominator" );
done_testing();

sub is_divide_by_zero {
    my ( $numerator, $denominator ) = @_;
    eval { my $answer = $numerator / $denominator; };
    if ( $@ =~ /Illegal division by zero/ ) {
        return 1;
    }
    else {
        return 0;
    }
}
