#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

use List::Util qw( min sample );

## ## ## ## ## MAIN:

my @A = <2 1 4 5 3 7>; #sample 12, (1..24);
my @windows;

for my $start (0..@A-2) {
    for my $end ($start+1..@A-1) {
        my $min = min @A[$start..$end];
        push @windows, [$min*($end-$start+1), $start, $end, $min];
    }
} 

my @sorted  = sort { $b->[0] <=> $a->[0]        } @windows;
my @largest = grep { $_->[0] == $sorted[0]->[0] } @sorted;

say "array (@A)";

for my $rect ( @largest ) {
    my $width = $rect->[2] - $rect->[1] + 1;
    say<<__EOD__;

rectangle found at:
    start index $rect->[1]
    end index   $rect->[2]
    height      $rect->[3]
    width       $width
    area        $rect->[0]
__EOD__
}



