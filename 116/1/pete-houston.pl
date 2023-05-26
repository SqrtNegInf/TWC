#!/usr/bin/env perl
use v5.36;

my $n = shift // 91011;

my $halflen = length ($n) / 2;

for my $power (1 .. $halflen) {
	my $parts = my $target = my $x = substr ($n, 0, $power);
	do {
		$target .= ++$x;
		$parts  .= ',' . $x;
	} until $target >= $n;
	if ($target == $n) {
		print "$parts\n";
		exit;
	}
}

print "$n\n";
