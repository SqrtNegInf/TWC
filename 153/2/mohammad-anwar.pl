#!/usr/bin/env perl
use v5.36;

use Test::More;

is(factorion(145), 1, 'Example 1');
is(factorion(123), 0, 'Example 2');

done_testing;

#
#
# METHOD

sub factorion {
    my ($n) = @_;

    my $s = 0;
    foreach my $_n (split //, $n) {
        my $f = 1;
        $f = $f * $_ for 1..$_n;
        $s = $s + $f;
    }

    return ($s == $n)?(1):(0);
}
