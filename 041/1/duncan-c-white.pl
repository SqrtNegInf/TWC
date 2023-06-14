#!/usr/bin/env perl
use v5.36;

use lib qw(.);	# I hate this!
use MakePrimes;
use PrimeFactors;

my $n = shift // 50;

my @primes = primes_upto( $n );
my %isprime = map { $_ => 1 } @primes;

foreach my $x (2..$n)
{
	my @factors = prime_factors( $x, @primes );
	my $nf = @factors;
	next unless $isprime{$nf};
	say "$x is an attractive number, factors are: ", join(',',@factors),
	    ", number factors $nf is prime";
}

