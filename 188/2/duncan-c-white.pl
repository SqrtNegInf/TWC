#!/usr/bin/env perl

use v5.36;

my( $x, $y ) = (4,6);

die "total-zero: x ($x) must be +ve\n" if $x<0;
die "total-zero: y ($y) must be +ve\n" if $y<0;

my $count = 0;
while( $x>0 && $y>0 )
{
	if( $x >= $y )
	{
		$x -= $y;
	} else
	{
		$y -= $x;
	}
	$count++;
}
say $count;
