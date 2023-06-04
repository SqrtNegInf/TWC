#!/usr/bin/env perl
use v5.36;

use Test::More;

sub find_leaders
{
     my @arr = @_;
     return @arr if scalar @arr == 1;
     
     my @leaders;
     unshift @leaders, pop @arr;

     for my $element ( reverse @arr )
     {
          if ( $element > $leaders[0] )
          {
               unshift @leaders, $element;
          }
     }
     return @leaders;
}





is_deeply([find_leaders(9, 10, 7, 5, 6, 1)], [(10, 7, 6, 1)], 'Example 1');
is_deeply([find_leaders(3, 4, 5)],           [(5)],           'Example 2');
done_testing();
