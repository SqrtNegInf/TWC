#!/usr/bin/env perl
use v5.36;

my $result;
for(my $i=0; 1; $i++){
	my %bag;
	my $sq= $i**2;
	$bag{$_}++ foreach (split "", $sq);
	$result=$sq;
	last if keys %bag >= 5;
}
print $result ."\n";

