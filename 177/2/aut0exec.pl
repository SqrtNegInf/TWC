#!/usr/bin/env perl

use strict;
use warnings;

my @primes = qw( 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 );

sub check_cyclops {
	
	my $check_val = shift;
	
	foreach my $prime ( @primes ) {
		if ( $check_val % $prime == 0 ) { return 0; }
	}
	
	return 1;
}

foreach (101..1600000) {
	
	if ($_ == reverse($_)) {
		# If number ends in these it's not prime
		my @nums = split(//, $_);
		if ( $nums[-1] =~ /0|2|4|5|6|8/) { next; }

		# If the sum of the digits is divisble by 3, it's not prime
		my $sum = 0;
		$sum += $_ for split(//, $_);;
		if ( $sum % 3 == 0) { next; } 

		# Check that middle digit is 0, length isn't even, that there aren't multiple zero in number, and that value is prime
		my $dig_length = length($_);
		if ( 0 == $nums[int((($dig_length/2)))] and 0 ne $dig_length % 2 and check_cyclops $_ and not $_ =~ /0{2,}/ ) { 		
			print ("$_ is a palindromic prime cyclops number!\n"); 
		} 
	}
	
	if ( $_ < 10000) {
		# Find primes to be used later to check palindromes
		my $i;
		for ( $i=3; $i < $_; $i++) {
			if ( ($_ % $i) == 0 ) { last; }
		}
		if ( $i eq $_ ) { push (@primes, $_); }
	}
}
