#!/usr/bin/env perl
use v5.36;

use bigint;
use constant BASE => 26;

sub int2label {
	my $int = $_[0] - 1;
	my @label;
	while ($int >= 0) {
		unshift @label, chr(ord('A') + $int % BASE);
		$int = $int / BASE - 1;
	}
	return join '', @label;
}

sub label2int {
	my @label = split '', $_[0];
	my $int = 0;
	for my $label (@label) {
		$int *= BASE;
		$int += ord($label) - ord('A') + 1;
	}
	return $int;
}

# last digit for BASE
my $last = chr(ord('A') + BASE - 1);

# build example input data if none provided
unless (@ARGV) {
	@ARGV = 
		map {((BASE**($_+1) - 1)/(BASE - 1) - 1, $last x $_)} (1 .. 14);
}

for (@ARGV) {
	if (/^\d+$/) {
		print "$_ -> ", int2label($_), "\n";
	} elsif (/^[A-$last]+$/) {
		print "$_ -> ", label2int($_), "\n";
	} else {
		print "input invalid: $_\n";
	}
}
