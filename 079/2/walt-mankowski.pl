#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

my @a = (2,1,4,1,2,5);

# build the histogram
my $rows = max(@a);
my $cols = @a;
my @hist;
for my $col (0..$#a) {
    for my $row (0..$rows-1) {
        $hist[$row][$col] = $row < $a[$col] ? 1 : 0;
    }
}

my $units = 0;
for my $row (1..$rows-1) {
    for my $col (1..$cols-1) {
        $units++ if trapped($row, $col, $cols, @hist);
    }
}

say $units;

sub trapped($row, $col, $max_col, @hist) {
    # check if we're at a wall
    return 0 if $hist[$row][$col];

    # look for left wall
    my $left = 0;
    for (my $c = $col-1; $c >= 0 && !$left; $c--) {
        $left = 1 if $hist[$row][$c];
    }

    # look for right wall
    my $right = 0;
    for (my $c = $col+1; $c < $max_col && !$right; $c++) {
        $right = 1 if $hist[$row][$c];
    }

    return $left && $right;
}
