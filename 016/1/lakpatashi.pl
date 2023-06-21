#!/usr/bin/env perl
use v5.36;
use feature qw(switch);

use List::Util qw(sum);

#part 1
my $total = 100000;
my $maxIdx;
my $maxPart = 0;
for my $i (1..100){
	$i /= 100;
	my $part = $total*$i;
	if ($part > $maxPart){
		$maxPart = $part;
		$maxIdx = $i*100;
	}
	#print "$i ==> $part\n";
	$total -= $part;
}
print "Person $maxIdx gets larger part\n";

