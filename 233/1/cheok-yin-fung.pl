#!/usr/bin/env perl
use v5.36;

use List::Util qw/uniqstr/;

sub sw {
    my @words = @_;
    my @cwords = map {join "", uniqstr sort {$a cmp $b} split "", $_} @words;
    my $ans = 0;
    for my $i (0..$#cwords) {
        for my $j ($i+1..$#cwords) {
            $ans++ if $cwords[$i] eq $cwords[$j];
        }
    }
    return $ans;
}


use Test::More tests=>3;
ok sw("aba", "aabb", "abcd", "bac", "aabc") == 2;
ok sw("aabb", "ab", "ba") == 3;
ok sw("nba", "cba", "dba") == 0;

