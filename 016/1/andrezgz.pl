#!/usr/bin/env perl
use v5.36;

my $pie = 100;
my %max;

for my $g (1..100) {
    my $slice = $g * $pie / 100;
    last if ($max{slice} && $max{slice} > $slice);
    %max = (guest => $g, slice => $slice);
    $pie -= $slice;
}

print sprintf("Guest %d gets the largest piece of the pie (%.2f%% of it)",$max{guest},$max{slice})."\n";
