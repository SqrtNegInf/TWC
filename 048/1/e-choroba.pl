#!/usr/bin/env perl
use v5.36;

my @people = 1 .. 50;
my $sword = 0;
while (@people > 1) {
    $sword = (1 + $sword) % @people;
    splice @people, $sword, 1;
    $sword %= @people;
}
say $people[0];
