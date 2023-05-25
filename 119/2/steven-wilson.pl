#!/usr/bin/env perl
use v5.36;

use Test::More;

ok( get_nth_element(5) == 13,    'Input: $N = 5 Output: 13' );
ok( get_nth_element(10) == 32,   'Input: $N = 10 Output: 32' );
ok( get_nth_element(60) == 2223, 'Input: $N = 60 Output: 2223' );
done_testing();

sub get_nth_element {
    my $nth     = shift;
    my $number  = 1;
    my $element = 1;
    while ( $element != $nth ) {
        $number++;
        if ( $number =~ m/^[1-3]+$/ ) {
            if ( !( $number =~ m/11/ ) ) {
                $element++;
            }
        }
    }
    return $number;
}
