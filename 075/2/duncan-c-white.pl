#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
#use Data::Dumper;
use List::Util qw(max);

#die "Usage: largest-histogram-rect values\n" if @ARGV==0;


#
# my @areas = rectangleareasofheight( $h, @value );
#	Find all rectangle areas of height $h in @value. Returns an array of
#	one or more numbers (each area).
#
fun rectangleareasofheight( $h, @value )
{
	# want to locate runs of adjacent values >= $h, each such run has
	# a width, that w * h is the area.  use a 2-state state machine:
	# state 0 is: not currently in such a run.
	# state 1 is: currently in such a run, $area is the current area of the run.
	my @result;
	my $state = 0;
	my $area = 0;
	foreach my $v (@value)
	{
		#say "debug: state=$state, v=$v, h=$h, area=$area";
		if( $state == 0 && $v>=$h )
		{
			# enter state 1, start counting the area
			$state=1; $area=$h;
		} elsif( $state == 1 && $v>=$h )
		{
			# stay in state 1: increase the area
			$area+=$h;
		} elsif( $state == 1 && $v<$h )
		{
			# finish one run, revert to state 0
			push @result, $area;
			#say "height $h: run area: $area, back to state 0 at value $v";
			$state = 0; $area = 0;
		}
	}
	# final possible extra area..
	if( $state == 1 )
	{
		push @result, $area;
		#say "height $h: run area: $area";
	}
	return @result;
}


#
# my @areas = allrectangleareas( @value );
#	Find all rectangle areas of @value.  Works by checking each height
#	separately.
#
fun allrectangleareas( @value )
{
	my @result;
	my $maxv = max @value;
	foreach my $h (1..$maxv)
	{
		#say "looking for rectangles of height $h";
		push @result, rectangleareasofheight($h,@value);
	}
	return @result;
}


my @values = <2 1 4 5 3 7>;
my @areas = allrectangleareas( @values );
#say Dumper \@areas;
my $max = max @areas;
say $max;
