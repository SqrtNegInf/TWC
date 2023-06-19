#!/usr/bin/env perl
use v5.36;

use lib qw(.);	# I hate this!
use MakePrimes;

my $n = 11111;

my @primes = primes_upto( $n );
my @factors = factorise( $n, @primes );
say "prime factors of $n are: ", join(',',@factors);


#
# my @factors = factorise( $n, @primes );
#	Break $n>1 apart into it's PRIME FACTORS (excluding 1),
#	using @primes as a list of all the prime numbers <= n
#	Return the list of prime factors, smallest first.
#	eg. factorise( 228 ) = 2,2,3,19
#
sub factorise( $n, @primes )
{
	die "factorise: n ($n) must be >1\n" if $n<=1;
	my @result;
	foreach my $p (@primes)
	{
		while( $n>1 && $n % $p == 0 )
		{
			push @result, $p;
			$n /= $p;
		}
		last if $n==1;
	}
	return @result;
}
