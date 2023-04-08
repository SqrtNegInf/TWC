#!/usr/bin/env perl

use v5.36.0;
use warnings;

my $n = $ARGV[0] || 5;

my $num_of_ways = 0;
my @a = (0) x ($n+2);
$a[1] = $n;
my $cnt = 1;
while ($cnt != 0) {
    my $xdum = $a[$cnt-1]+1;
    my $ydum = $a[$cnt]-1;
    $cnt--;
    while ($xdum <= $ydum) {
        $a[$cnt] = $xdum;
        $ydum -= $xdum;
        $cnt++;
    }
    $a[$cnt] = $xdum+$ydum;
    # Print Result
    for my $i (0..$cnt) {
        print $a[$i], " ";
    }
    $num_of_ways++;
    say "";
}

# Print Final Result
say "Number of Ways: ", $num_of_ways;
