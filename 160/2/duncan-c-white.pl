#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use List::Util qw(sum0);
use Function::Parameters;

my @n = (1, 3, 5, 7, 9);
my $equiindex = equi_index( @n );
say $equiindex;

#
# my $equiindex = equi_index( @n );
#	Return the equi index (as defined above) of @n,
#	if there is one, or -1 if there isn't.
#
fun equi_index( @n )
{
	my $sumafter = sum0( @n ) - $n[0] - $n[1];
	my $sumbefore = $n[0];
	foreach my $i (1..$#n-1)
	{
		return $i if $sumbefore == $sumafter;
		$sumbefore += $n[$i];
		$sumafter  -= $n[$i+1];
	}
	return -1;
}
