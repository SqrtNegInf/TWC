#!/usr/bin/env perl
use v5.36;

use Getopt::Long::Modern;

my $divno = 8;
my $max   = 10;
GetOptions (
	'v' => \my $verbose,
	'd=i' => \$divno,
	'n=i' => \$max,
);

print "The first $max positive integers having exactly $divno divisors:\n"
	if $verbose;

my $found = 0;
my $i     = 1; # By inspection this could be 24

while ($found < $max) {
	my @div = (1, $i);
	my $j = int sqrt $i;
	while ($j > 1) {
		unless ($i % $j) {
			my $q = $i / $j;
			push @div, $j;
			push @div, $q unless $q == $j;
		}
		$j--;
	}
	if ($divno == @div) {
		print "$i\n";
		print "  Divisors are: (@div)\n" if $verbose;
		$found++;
	}
	$i++;
}
