#!/usr/bin/env perl
use v5.36;

my @n = (5, 2, 9, 1, 7, 6, 9);
#my @n = (4, 2, 3, 1, 5, 0);

my $max=-1;
my $maxi=-1;
foreach my $i (0 .. $#n){
	if ($n[$i]>$max){
		$max=$n[$i];
		$maxi=$i;
	}
}
print "$maxi\n";
