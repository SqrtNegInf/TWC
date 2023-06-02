#!/usr/bin/env perl
use v5.36;

my $ans    = 0;
my $in     = -1700;
my $intmax = 2**31 - 1;
my $intmin = -1 - $intmax;

if ($in && $in =~ /^(-?)(\d+)$/a) {
	my $rev = $1 . reverse $2;
	$ans = $rev if ($rev <= $intmax && $rev >= $intmin);
}

printf "%i\n", $ans;
