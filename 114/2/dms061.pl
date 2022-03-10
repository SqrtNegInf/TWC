#!/usr/bin/env perl

sub count_ones {
	my $n = shift;
	# sprintf "%b, $n" creates a bitstring for $n and
	# tr/1// counts the number of 1s in the string
	return sprintf("%b", $n) =~ tr/1//;
}

my $n = shift // 12;
die "Integer needs to be positive!\n" if $n < 1;

my $count = count_ones $n; 
# Iterate until we have a match
do { ++$n; } until count_ones ($n) == $count;
print "$n\n";

