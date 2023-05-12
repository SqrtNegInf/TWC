#!/usr/bin/env perl
use v5.36;

my @pern;
my $max    = shift // 10;
my $i      = 1;
my %prime  = primes_to (64);

while (@pern < $max) {
	push @pern, $i if $prime{ones (binary ($i))};
	$i++;
}
print "@pern\n";

sub binary {
	return sprintf ("%b", shift);
}

sub ones {
	return shift =~ tr /1/1/;
}

# Sieve of Eratosthenes
sub primes_to {
	my $max = shift;
	return () if $max < 2;
	my %cand = map { $_ => 1 } 2 .. $max;
	my $i = 2;
	my $root = sqrt ($max);
	while ($root >= $i) {
		for (my $j = $i + $i; $j <= $max; $j += $i) {
			delete $cand{$j};
		}
		do { $i++ } until $cand{$i} || $root < $i;
	}
	return %cand;
}
