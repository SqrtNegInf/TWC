#!/usr/bin/env perl
use v5.36;

use List::Util qw/all min/;

sub za {
    my @ints = $_[0]->@*;
    my $step = 0;
    while (!all {!$_} @ints) {
        my $m = min grep {$_} @ints;
        @ints = map {$_ - $m if $_} @ints;
        $step++;
    }
    return $step;
}

use Test::More tests=>3;
ok za([1, 5, 0, 3, 5]) == 3;
ok za([0]) == 0;
ok za([2, 1, 4, 0, 3]) == 4;
