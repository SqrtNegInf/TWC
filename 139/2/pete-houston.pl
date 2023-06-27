#!/usr/bin/env perl
use v5.36;

use bignum;
use Math::Prime::Util 'next_prime';

my $i = 1;
my @longs;

while (5 > @longs) {
	$i = next_prime ($i);
	push @longs, $i if is_long ($i);
}

print "First 5 long primes are: @longs\n";

sub is_long {
	my $p = shift;
	my $rlen = $p - 1; # Length of repeating pattern

	my $q = 1 / $p;
	$q =~ s/^[0.]+//;
	return if 2 * $rlen > length $q;
	my $pat = substr ($q, 0, $rlen);
	return substr ($q, $rlen, $rlen) eq $pat;
}
