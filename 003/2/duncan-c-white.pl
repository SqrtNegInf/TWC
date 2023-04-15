#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;

use Function::Parameters;

my $n = shift // 10;

my @curr = (1);			# current row
my @next;			# next row, one element longer than @curr

for( my $row=1; $row<=$n; $row++ )
{
	print "row $row: ".join(',',@curr)."\n";
	@next = ( );
	for( my $i=0; $i<=@curr; $i++ )
	{
		$next[$i] = ($i==0?0:$curr[$i-1]) + ($i==@curr?0:$curr[$i]);
	}
	@curr = @next;
}
