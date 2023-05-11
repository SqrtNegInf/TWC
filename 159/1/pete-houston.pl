#!/usr/bin/env perl
use v5.36;

my $n = 7;
die "Argument must be natural number.\n"
	unless defined ($n) && $n =~ /^[1-9][0-9]*$/;

# Initialise the sequence
my ($fn, $fd, $ln, $ld) = (0, 1, 1, $n);
my @seq = ("$fn/$fd", "$ln/$ld");

# Loop over the rest
while ($ln < $n) {
	my $x = int (($n + $fd) / $ld);
	($fn, $fd, $ln, $ld) = ($ln, $ld, $x * $ln - $fn, $x * $ld - $fd);
	push @seq, "$ln/$ld" if $ld >= $ln;
}

print "@seq\n";
