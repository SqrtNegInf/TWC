#!/usr/bin/env perl
use v5.36;

my @L = (19,11,9,7,20,3,17,16,2,14,1);


@L = sort {$a <=> $b} @L;


my $i=0;
while ($i<=$#L) {
	if ($L[$i] == $#L-$i ) {print $L[$i]; exit;} 
	$i++;
}
print "-1";
