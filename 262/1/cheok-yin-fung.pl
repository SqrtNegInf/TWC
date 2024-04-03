#!/usr/bin/env perl
use v5.36;

sub mpn {
    my @ints = @_;
    my $p = grep {$_ > 0} @ints;
    my $n = grep {$_ < 0} @ints;
    return $p > $n ? $p : $n;
}

use Test::More tests=>4;
ok mpn(-3, 1, 2, -1, 3, -2, 4) == 4;
ok mpn(-1,-2,-3, 1) == 3;
ok mpn(1,2) == 2;
ok mpn(0,0,0) == 0;
