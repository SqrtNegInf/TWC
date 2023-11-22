#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

sub floor_sum
{
     my @arr = @_;
     my $sum = 0;
     for my $i ( 0 .. $#arr )
     {
          for my $j ( 0 .. $#arr )
          {
               $sum += int($arr[$i]/$arr[$j]);
          }
     }
     return $sum;
}


is(floor_sum(2, 5, 9), 10, 'Example 1');
is(floor_sum(7, 7, 7, 7, 7, 7, 7), 49, 'Example 2');
done_testing();
