#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is mac_address('1ac2.34f0.b1c2'), '1a:c2:34:f0:b1:c2', 'Example 1';
is mac_address('abc1.20f1.345a'), 'ab:c1:20:f1:34:5a', 'Example 2';

done_testing;

#
#
# METHOD

sub mac_address($str) {
    $str =~ s/\.//g;
    my @chars = split //, $str;

    my $i   = 0;
    my @str = ();
    while ($i < @chars) {
        push @str, $chars[$i].$chars[$i+1];
        $i += 2;
    }

    return join(":", @str);
}
