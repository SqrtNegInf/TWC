#!/usr/bin/env perl
use v5.36;

my $start = $ARGV[0] || 100;
my $stop  = $ARGV[1] || 999;

while ($start <= $stop) {
    my ($d1, $d2, $d3) = split //, $start, 3;
    if ( ((($d1 - $d2) == 1) && (($d2 - $d3) == 1))
         || ((($d2 - $d1) == 1) && (($d3 - $d2) == 1)) ) {
        print "$start\n";
    }
    $start++;
}
