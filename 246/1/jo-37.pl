#!/usr/bin/env perl
use v5.36;

srand 1;

say for sixoutoffortynine();


### Implementation

sub sixoutoffortynine {
	my @pool = (1..49);
    my @winning;
    push @winning, splice @pool, rand @pool, 1 for 1 .. 6;
    sort {$a <=> $b} @winning;
}
