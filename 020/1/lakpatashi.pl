#!/usr/bin/env perl
use v5.36;

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


