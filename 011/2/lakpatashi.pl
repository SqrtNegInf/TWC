#!/usr/bin/env perl
use v5.36;

my @arr;
my $n = 5;
for (my $i =0; $i < $n; $i++){
	for (my $j =0; $j < $n; $j++){
		$arr[$i][$j] = $i==$j? 1 : 0;
	}
}


for my $line (@arr){
	print join(' ',@{$line}	),"\n";
}
