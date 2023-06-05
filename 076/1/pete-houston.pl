#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'primes';
use Lingua::EN::Inflexion;
use List::Util qw/min/;

my $target = 51;
die "Target must be an integer greater than 1"
	unless defined $target && $target == int $target && $target > 1;

my @primelist = min_prime_sum ($target);

use feature 'say';
say my $primetot = @primelist;

# this continually varies, so skip:
#my @sorted = sort { $a <=> $b } @primelist;
#print inflect ("<#n:$primetot> as sum of $primetot prime <N:numbers> i.e. ") .
#	join (' and ', @sorted) . " is same as the input number\n" .
#	join (' + ', @sorted) . " = $target.\n";

sub min_prime_sum {
	my $target  = shift;
	my @primes  = @{primes ($target)};
	my %uniques = map { $target - $_ => $_ } @primes;

	# Target is prime
	return ($target) if $uniques{0};

	# sum of 2 primes
	for my $try (@primes) {
		return ($try, $uniques{$try}) if $uniques{$try};
	}

	# sum of 3 primes
	require Math::Combinatorics;
	my @freqs = map { int min (2, $target / $_) } @primes;
	my $combinator = Math::Combinatorics->new (
		count      => 2,
		data       => \@primes,
		frequency  => \@freqs
	);
	while (my @multiset = $combinator->next_multiset) {
		my $sum = $multiset[0] + $multiset[1];
		return (@multiset, $uniques{$sum}) if $uniques{$sum};
	}

	# Don't see this happening!
	die qq#Goldbach says, "No".\n#;
}
