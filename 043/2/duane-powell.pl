#!/usr/bin/env perl
use v5.36;

my $base = 5;
die "$base must be between 0 and 11, ie 1-10" unless ($base > 0 and $base < 11);

# Search through all numbers from 0 to the number of digits in the base, 
# checking for a self descriptive number (SDN). Very slow for base > 7.
my $max = '1' . '0' x $base;
foreach (0 .. $max) {
	say $_ if SDN($_,$base);
}

sub SDN {
	my $n    = shift; 
	my $base = shift;
 
	my @n = split(//,$n);                       # Split $n into separate digits
	return 0 unless (scalar @n == $base);       # A SND is the same length as its base

	my %count;
	$count{$_} = 0 foreach (0 .. scalar(@n)-1); # Init a counter to all 0's
	$count{$_}++   foreach (@n);                # Count the occurance of each digit 

	# Determine if $n "describes" itself by comparing
	# the count to the digit found at index $i
	my $i = 0;
	foreach (0 .. scalar(@n)-1) {
		return 0 if ($count{$_} != $n[$i]); # not a SDN, exit
		$i++; 
	}
	return 1; # All digits matched the counts, this is an SDN
}
