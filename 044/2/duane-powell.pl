#!/usr/bin/env perl
use v5.36;

my @solution;
my $goal = 200;
push @solution, $goal;
while ($goal > 1) {
	$goal = ($goal % 2) ? $goal-1 : $goal/2; # if odd number deduct 1 making it even, otherwise divide by 2
	push @solution, $goal;                   # push this step into the solution set
}
say join(',',reverse(@solution));
