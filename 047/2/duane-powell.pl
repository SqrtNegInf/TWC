#!/usr/bin/env perl
use v5.36;

my @gap;
my $n = 100;
while (scalar @gap < 20) {
	my ($a,undef,$b) = split(//,$n);
	my $x = "$a$b"; # form new number by combining first and last digit of $n
	
	push @gap, $n if ($n/$x == int($n/$x)); # $n is a gapped number if it is divisible by $x
	$n++;
}
say join(',',@gap);
