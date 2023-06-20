#!/usr/bin/env perl
use v5.36;

sub ackermann {
	my ($m, $n) = @_;
	if ($m == 0) {
		return $n+1;
	} elsif ($m > 0 and $n == 0) {
		ackermann($m-1, 1);
	} elsif ($m > 0 and $n > 0) {
		ackermann($m-1, ackermann($m, $n-1));
	} else {
		die "invalid Ackerman number pair";
	}
}	

for my $m (0..2) {
	for my $n (0..2) {
		my $a = ackermann($m,$n);
		say "ackermann($m,$n) = $a";
	}
}
