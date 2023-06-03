#!/usr/bin/env perl
use v5.36;

sub get_dec2bin {
    my $what = shift;

    my $count;

    for (1..$what) {
        my $str = unpack("B32", pack("N", $_));
        $count += () = $str =~ /1/g;
    }

    return $count % 1_000_000_007;
}

use Test::More;

is(get_dec2bin(4), 5, 'Test 4');
is(get_dec2bin(3), 4, 'Test 3');

done_testing;


