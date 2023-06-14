#!/usr/bin/env perl
use v5.36;

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
