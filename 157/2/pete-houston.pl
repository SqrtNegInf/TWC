#!/usr/bin/env perl
use v5.36;

use Math::NumberBase;

my $n = 7;

# Validate
die "Bad argument - must be integer > 3\n" 
	unless defined ($n) && $n > 3 && $n =~ /^[0-9]+$/;

for my $base (2 .. $n - 2) {
	# Calculate n in this base
	my $conv = Math::NumberBase->new ($base);
	my $x = $conv->from_decimal ($n);
	# Are all the digits in the number the same?
	exit ! print "1\n" if same_digits ($x);
}

print "0\n";

sub same_digits {
	my $str = shift;
	my $first = substr $str, 0, 1;
	for my $pos (1 .. length ($str) - 1) {
		return 0 unless $first eq substr $str, $pos, 1;
	}
	return 1;
}
