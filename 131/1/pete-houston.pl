#!/usr/bin/env perl
use v5.36;

my @out;
my @A = (1, 2, 3, 6, 7, 8, 9);
print '(';
for my $n (map { s/[^0-9]//; $_ } @A) {
	if ($#out == -1 || $n == $out[-1] + 1) {
		push @out, $n;
	} else {
		print '[' . join (', ', @out) . '], ';
		@out = $n;
	}
}
print '[' . join (', ', @out) . "])\n";
