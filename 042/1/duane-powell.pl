#!/usr/bin/env perl
use warnings;
use strict;
use feature qw( say );

# Write a script to print decimal number 0 to 50 in Octal Number System.

my $decimal_no = shift;
if ($decimal_no) {
	say convert_to_octal($decimal_no);
}
else {
	for (0 .. 50) {
		say convert_to_octal($_);
	}
}

sub convert_to_octal {
	my $n = shift;
	return 0 if ($n == 0);
	my @oct;
	while ($n > 0) {
		my $remainder = $n/8 - int($n/8);
		push @oct, $remainder * 8;
		$n = int($n/8);
	}
	return join('',reverse @oct);
}
