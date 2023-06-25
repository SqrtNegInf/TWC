#!/usr/bin/env perl
use v5.36.0;

use List::Util qw/min/;

my @arrs = ([1,2,3,4],[0,2,1,3]);
my @pairs = ([0,1,2,3], [0,2,1,3], [0,3,1,2]);
my $maxval = 0;

for my $arr (@arrs) {
    say "Input: \@array = [",@$arr,"]";
    for my $pr (@pairs) {
        my @a1 = @$pr;
        my $sum = @$arr[min(@a1[0..1])] + @$arr[min(@a1[2..3])];
        if ($sum > $maxval) {
            $maxval = $sum;
        }
    }
    print "Output: $maxval\n\n";
    $maxval = 0;
}
