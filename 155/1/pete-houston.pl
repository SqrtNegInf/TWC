#!/usr/bin/env perl 

use v5.36;

use Math::Prime::Util qw/pn_primorial next_prime/;

my %fortunate;
my $n   = 1;
my $max = shift // 8;

while ($max > keys %fortunate) {
	my $primorial = pn_primorial ($n);
	my $m = next_prime ($primorial + 1) - $primorial;
	$fortunate{$m} = 1;
	$n++;
}

print join (', ', sort { $a <=> $b } keys %fortunate) . "\n";
