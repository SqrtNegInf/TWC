#!/usr/bin/env perl
use v5.36;

use Getopt::Long::Modern;

GetOptions (v => \my $verbose);

my $maxn     = 10_000_000;
my $maxiter  = 500;
my $n        = 196;

die "Bad argument: must be integer between 10 and 1000 inclusive.\n"
	unless defined ($n) && $n =~ /^[1-9][0-9]{1,3}$/;

for (1..$maxiter) {
	my $rev = reverse $n;
	if ($rev eq $n) { print "0\n"; exit; }
	print "$n + $rev = " if $verbose;
	$n += $rev;
	print "$n\n" if $verbose;
	if ($n > $maxn) { print "1 (Total of $n is above $maxn)\n"; exit; }
}
print "1 (Reached $maxiter iterations)\n";
