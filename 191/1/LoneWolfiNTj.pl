#!/usr/bin/env perl
use v5.36;
# Set item separator to "," for printing arrays:
$, = ',';

# Default inputs:
my @arrays = ( [1,2,3,4] , [1,2,0,5] , [2,6,3,1] , [4,5,2,3] );

# Non-default input (one array only, via space-separated command-line arguments:
if (@ARGV) {@arrays = ( [@ARGV] );}

for my $ar (@arrays)
{
   my @array = reverse sort {$a <=> $b} @$ar and my $twice = 1;
   $array[0] < 2 * $_ and $twice = -1 and last for @array[1..$#array];
   print "("; print @$ar; print ") -> "; printf("%2d",$twice); print "\n";
}
