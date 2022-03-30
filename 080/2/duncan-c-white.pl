#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
use Data::Dumper;
use List::Util qw(max);

my @r = (1, 4, 3, 2);

#
# my $candies = count_candies( @r );
#	Count the number of candies to be given to people with
#	rankings @r; return the number of candies.
#
fun count_candies( @r )
{
	my $candies=@r;
	foreach my $pos (0..$#r)
	{
		$candies++ if $pos>0 && $r[$pos-1] < $r[$pos];
		$candies++ if $pos<$#r && $r[$pos+1] < $r[$pos];
	}
	return $candies;
}


#
# my $candies = count_candies2( @r );
#	BETTER WAY to count the number of candies to be given to people with
#	rankings @r; it occurred to me that an extra candy is given whenever
#	each adjacent pair of rankings are different (if the first is bigger,
#	the extra candy is given to the first person, otherwise to the second).
#	only if the two adjacent rankings are the SAME is no extra candy given.
#
fun count_candies2( @r )
{
	my $candies=@r;
	foreach my $pos (0..$#r-1)
	{
		$candies++ if $r[$pos] != $r[$pos+1];
	}
	return $candies;
}


my $candies = count_candies( @r );
my $candies2 = count_candies2( @r );
die "candies:$candies, candies2:$candies2\n" unless $candies==$candies2;
say $candies;
