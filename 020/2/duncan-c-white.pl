#!/usr/bin/env perl
use v5.36;

use Data::Dumper;

my $upper = 1000;

my @spd;	# spd[i] == sum of proper divisors of i

#
# my $spd = sum_proper_divisors($n);
#	Generate and return the sum of all the proper divisors of $n,
#	the proper divisors are those integer divisors (factors) of $n
#	INCLUDING 1 and EXCLUDING $n ITSELF.  eg the proper divisors of
#	$n==6 are 1,2 and 3, and their sum is 6.
#
sub sum_proper_divisors( $n )
{
	my $sum = 0;
	for( my $f=1; $f<$n; $f++ )
	{
		next unless $n % $f == 0;
		$sum += $f;
	}
	return $sum;
}



foreach my $p (2..$upper)
{
	$spd[$p] //= sum_proper_divisors($p);
	my $q = $spd[$p];
	next if $q <= $p;
	$spd[$q] //= sum_proper_divisors($q);
	next unless $spd[$q] == $p;
	print "found amicable pair p=$p, q=$q (spd[p]=$spd[$p], spd[q]=$spd[$q])\n";
}
