#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(is_prime);

my $limit = shift || 10;

my @weak;
my @strong;
my @balanced;
my $p = 5;
my @primes = (2,3,$p);
my ($l,$m,$r) = @primes;
while (@weak < $limit or @strong < $limit) {
	$p+=2;
	next unless is_prime($p);

	push @primes, $p;
	if (($l+$r)/2 < $m) {
		push @strong, $m;
	} elsif (($l+$r)/2 > $m)  {
		push @weak, $m;
	} else {
		push @balanced, $m;
	}	
	($l,$m,$r) = ($m,$r,$p);
}

say "primes: " . join(",", @primes);
say "weak primes: " . join(",", @weak);
say "balanced primes: " . join(",", @balanced);
say "strong primes: " . join(",", @strong);

__END__

perl -MCPAN -e 'install Math::Prime::Util'

./ch1.pl 
primes: 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103
weak primes: 3,7,13,19,23,31,43,47,61,73,83,89
balanced primes: 5,53
strong primes: 11,17,29,37,41,59,67,71,79,97

