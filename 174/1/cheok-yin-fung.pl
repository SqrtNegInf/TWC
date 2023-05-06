#!/usr/bin/env perl
use v5.36;

my $d = 0;
my $n = 0;
while ($d < 18) {
    my @arr = split "", $n;
    my $total = 0;
    $total += $arr[$_]**($_+1) for 0..$#arr;
    if ($total == $n) {
        say $n;
        $d++;
    }
    $n++;
}
