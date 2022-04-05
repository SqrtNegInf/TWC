#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
use Data::Dumper;

my( $m, $n ) = (5,3);


#
# my @l = combinations( $lo, $hi, $n, @pre );
#	Find all sorted combinations of $n digits from $lo..$hi
#	prepending @pre to every combination found.
#
fun combinations( $lo, $hi, $n, @pre )	# @pre is a list of numbers
{
	#say "combinations: lo=$lo, hi=$hi, n=$n, x=", join(',',@pre);
	my @l;			# list of lists
	foreach my $i ($lo..$hi-$n+1)
	{
		my @y = @pre;
		push @y, $i;
		#say "i=$i, y=", Dumper \@y;
		push @l, $n==1 ?
			[ @y ] :
			combinations( $i+1, $hi, $n-1, @y );
	}
	return @l;
}


my @l = combinations( 1, $m, $n, () );
say '[ ', join(', ', map { '['. join(',',@$_). ']' } @l ), ' ]';
