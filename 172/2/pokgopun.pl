#!/usr/bin/env perl
use v5.36;

my @a = sort{$a <=> $b} 0..11;

printf "Input: (%s)\n", join(", ",@a);
my @fn = ($a[-1], @a==1 ? $a[0] : median(@a[int(@a/2)+@a%2..$#a]), median(@a), @a==1 ? $a[0] : median(@a[0..int(@a/2)-1]), $a[0]);
my $i = 5;
foreach (qw/sample_minimum lower_quartile median upper_quartile sample_maximum/){
	printf "%s: %s\n", $_, $fn[--$i];
}

sub median{
	return @_ % 2 ? $_[int(@_/2)] : ($_[@_/2-1] + $_[@_/2])/2;
}
