#!/usr/bin/env perl
use v5.36;

use Test::More tests => 1;

ok( decimal_to_octal(1792) == 3400, "test decimal 1792 is octal 3400" );

sub decimal_to_octal {
    my $dec = shift;
    my $result;
    while ( $dec > 7 ) {
        $result .= $dec % 8;
        $dec = int( $dec / 8 );
    }
    $result .= $dec;
    return scalar reverse $result;
}

for ( 0 .. 50 ) {
    say "Decimal $_ = Octal ", decimal_to_octal($_);
}
