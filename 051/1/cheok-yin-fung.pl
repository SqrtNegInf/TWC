#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;
use List::Util qw{sum};

my $target = 0;

my @L = (-25, -10, -7, -3, 2, 4, 8, 10);


my $tripets = Math::Combinatorics->new( count => 3 , data => [@L] );

while (my @tsum = $tripets->next_combination) {
	print join(" ", sort {$a<=>$b} @tsum)."\n" if $target == sum @tsum;
}
