#!/usr/bin/env perl
use v5.36;

use Math::GMP;

my $target = Math::GMP->new (125);
for my $power (2 .. $target) {
	my ($root, $rem) = $target->brootrem ($power);
	unless ($rem) {
		print "$root ** $power = $target\n1\n";
		exit;
	}
	last if $root < 2;
}
print "0\n";
