#!/usr/bin/env perl

use warnings;
use strict;

my ($str) = 'bookkeeper';
my @arr = split //,$str;
my $char = shift @arr;
print $char;
for my $x (@arr){
	if($x ne $char){
		print " ";
		$char = $x;
	}
	print $x;
}


