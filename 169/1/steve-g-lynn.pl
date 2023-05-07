#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(primes);

my @brilliants = ();

for my $n (1,2) { # get 1 or 2 digit primes with each iteration
	my $ra=primes(10**($n-1), 10**($n)); 
		
	for my $i (0 .. @$ra-1) {
		for my $j ($i .. @$ra-1) {
			push (@brilliants, 
			$$ra[$i] * $$ra[$j] );
		}
	} 
}
	
@brilliants = sort{$a <=> $b} @brilliants;

foreach (0 .. 19) {
	print $brilliants[$_]," ";
}

print "\n";




