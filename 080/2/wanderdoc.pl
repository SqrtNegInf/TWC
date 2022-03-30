#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test::More;


is(count_candies(1, 2, 2), 4,     'Example 1');
is(count_candies(1, 4, 3, 2), 6,  'Example 2');
is(count_candies(2, 0, 2), 5,     'New Example');

done_testing();




sub count_candies
{
     my @arr = @_;

     my $candies = scalar @arr;
     return $candies if $candies == 1;

     $candies++ if ($arr[0] > $arr[1]);

     $candies++ if ($arr[$#arr] > $arr[$#arr - 1]);
     
     for my $i ( 1 .. $#arr - 1 )
     {

          $candies++ if ( $arr[$i] > $arr[$i - 1] or $arr[$i] > $arr[$i + 1] );
     }
     return $candies;

}
