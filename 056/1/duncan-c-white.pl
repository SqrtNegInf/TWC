#!/usr/bin/env perl
use v5.36;

my $k = 2;
my @n = (2, 7, 9);

foreach my $i (0..$#n)
{
	foreach my $j (0..$#n)
	{
		next if $i==$j;
		say "$i,$j" if $n[$i]-$n[$j]==$k;
	}
}
