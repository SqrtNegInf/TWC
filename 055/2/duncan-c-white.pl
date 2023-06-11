#!/usr/bin/env perl
use v5.36;

my @list = 1..4;

# sort so we can exclude the smallest
@list = sort @list;

# foreach n1 in @list apart from the smallest
foreach my $n1pos (1..$#list)
{
	my $n1 = $list[$n1pos];
	my @left = @list;
	# remove $n1 from @left
	splice(@left,$n1pos,1);
	#say "removed $n1 from list, remainder is ", Dumper(\@left);
	findwaves( 1, $n1, $n1, @left );
}


#
# findwaves( $less, $curr, $wavesofar, @left );
#	Given the boolean $less, the current value $curr, the wave-list so far
#	$wavesofar (of the form a-b-..$curr) and the unused elements @left,
#	find all wave arrays by extending $wavesofar with all possible next
#	elements from @left that are (LESS THAN if $less, GREATER THAN if !
#	$less) or equal to $curr.  Print all wave arrays as we find them.
#
sub findwaves( $less, $curr, $wavesofar, @left )
{
	my @possnext = grep
		{ ($less && $_ <= $curr) || (!$less && $_ >= $curr) }
		@left;
	return unless @possnext;
	foreach my $next (@possnext)
	{
		my @stillleft = grep { $_ != $next } @left;
		my $nextwave = $wavesofar."-$next";
		if( @stillleft )
		{
			findwaves( 1-$less, $next, $nextwave, @stillleft );
		}
		else
		{
			say $nextwave;
		}
	}
}
