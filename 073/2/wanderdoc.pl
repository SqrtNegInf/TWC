#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);
use Test::More;


sub smallest_neighbour
{
     my @arr = @_;
     my @small;
     $small[0] = 0;

     for my $i ( 1 .. $#arr )
     {
          push @small, min(@arr[0..$i-1]) < $arr[$i] ? min(@arr[0..$i-1]) : 0;
     }
     return @small;
}


is_deeply([smallest_neighbour(7,8,3,12,10)], [0,7,0,3,3], 'Example 1');
is_deeply([smallest_neighbour(4,6,5)],       [0,4,4],     'Example 2');
done_testing();
