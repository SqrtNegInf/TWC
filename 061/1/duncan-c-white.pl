#!/usr/bin/env perl
use v5.36;

my @l = ( 2, 5, -1, 3 );
my $max = $l[0];
my $maxfrom = 0;
my $maxto = 0;

foreach my $i (0..$#l)
{
	my $prod = $l[$i];
	if( $prod > $max )
	{
		$max = $prod;
		$maxfrom = $i;
		$maxto = $i;
	}
	foreach my $j ($i+1..$#l)
	{
		$prod *= $l[$j];
		if( $prod > $max )
		{
			$max = $prod;
			$maxfrom = $i;
			$maxto = $j;
		}
	}
}

say "maximum product is $max, ", join('x',@l[$maxfrom..$maxto]);
