#!/usr/bin/env perl
use v5.36;

use POSIX qw(floor);
use List::Util qw(all);
use Algorithm::Combinatorics qw(permutations);

my @A = (3,6,10,15);

my %seen;
for(permutations[@A]){
    my @permutation=@$_;
    next if $seen{"@permutation"};
    $seen{"@permutation"}++;
    say "    @permutation"
	if all {my $x=sqrt($_); $x==floor $x}
        map {$permutation[$_]+$permutation[$_+1]}
        0..@permutation-2;
}
