#!/usr/bin/env perl
use v5.36;

my $pie = 1;
my @guest_slice;
for my $guest (1..100) {
    my $slice = $guest/100*$pie;
    $pie -= $slice;
    push @guest_slice, [$guest => $slice];
}

@guest_slice = reverse sort {$a->[1]<=>$b->[1]} @guest_slice;

say "Guest ",$guest_slice[0][0], " gets ",
    sprintf("%.4f", $guest_slice[0][1]*100), "% of the pie.";
