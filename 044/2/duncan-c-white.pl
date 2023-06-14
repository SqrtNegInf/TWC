#!/usr/bin/env perl
use v5.36;

my $goal = shift // 200;
my $seq = search( 1, $goal );
say "$goal can be achieved by shortest sequence $seq";

my $curr = 1;
say "start with $curr, goal: $goal";
foreach my $op (split(//,$seq))
{
	if( $op eq "i" )
	{
		$curr++;
		say "increment curr to $curr";
	} else
	{
		$curr *= 2;
		say "double curr to $curr";
	}
}
say "result: $curr, goal: $goal";


#
# my $shortseq = search( $initial, $goal );
#	Given that you have $initial dollars, and you want $goal dollars,
#	perform a breadth-first search to find the $goal in the smallest
#	number of increment or doubling steps.  Return the shortest sequence
#	or 'i' (increment) or 'd' (double) steps that result in $goal dollars.
#
#	Do this using a todo list of ( $dollars, $sequence ) pairs.
#
sub search( $initial, $goal )
{
	my $seq = "";
	my @todo = ( [$initial, ""] );
	for(;;)
	{
		# Build a new list of todo pairs, twice as long as the old one.
		# stopping if we hit $goal
		my @newtodo;
		foreach my $pair (@todo)
		{
			my( $currvalue, $currseq ) = @$pair;
	return $currseq if $currvalue == $goal;

			# try doubling $currvalue
			push @newtodo, [ 2 * $currvalue, $currseq."d" ];

			# try incrementing $currvalue
			push @newtodo, [ $currvalue + 1, $currseq."i" ];
		}
		@todo = @newtodo;
	}
}


