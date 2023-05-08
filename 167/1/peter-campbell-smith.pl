#!/usr/bin/env perl
use v5.36;

my (@sieve, $count, $j, $c, $results, @seen);

# make sieve
@sieve = make_sieve(1000000);

# seek circular primes > 100
$count = 0;
OUTER: for $j (100 .. 1000000) {
	# skip $j if not prime
	next unless $sieve[$j];
	
	# permute the digits of $j
	$c = $j;
	while (1) {
		
		# take the last digit and make it the first
		$c =~ m|(.*)(.)|;
		$c = $2 . $1;
		
		# finish if we're back where we started
		last if $c == $j;
		
		# no good if the permuted number is not prime or it's a permutation
		# of a circular prime we've already found
		next OUTER if (not $sieve[$c] or $seen[$c]);
	}
	
	# result!!
	$seen[$j] = 1;
	$results .= qq[$j, ];
	last if $count++ == 10;
}
say qq[\nThe following are circular primes:\n] . substr($results, 0, -2);

sub make_sieve {
	
	# make sieve of Eratosthenes - $j is prime if $sieve[$j];
	my ($arg, $j, $k, @sieve);
	
	# set all values provisionally to 1 (ie prime)
	$arg = $_[0];
	for $j (0 .. $arg) {
		$sieve[$j] = 1;
	}
	
	# for each prime in turn, set its multiples to 0 (ie not prime)
	for $j (2 .. $arg) {
		next unless $sieve[$j];   # $j is not prime		
		last if $j ** 2 > $arg;
		for $k ($j .. $arg) {
			last if $k * $j > $arg;
			$sieve[$k * $j] = 0;
		}
	}
	return @sieve;
}
