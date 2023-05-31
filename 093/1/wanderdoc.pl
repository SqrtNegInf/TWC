#!/usr/bin/env perl
use v5.36;

use List::Util qw(min max);
use Test::More;

sub max_points
{
     my @coords = @_;


     my $max = 1;
     for my $i ( 0 .. $#coords)
     {

          my $same_place = 1;
          my $same_y     = 1;
          my %same_slope;


          for my $j ( $i .. $#coords )
          {
               if ( $coords[$i]->[0] == $coords[$j]->[0] and 
                    $coords[$i]->[1] == $coords[$j]->[1]
               )
               {
                    $same_place++;
               }

               elsif ( $coords[$i]->[0] == $coords[$j]->[0])
               {
                    $same_y++;
               }
               else
               {
                    my $diff_x = $coords[$i]->[0] - $coords[$j]->[0];
                    my $diff_y = $coords[$i]->[1] - $coords[$j]->[1];

                    $same_slope{ sprintf("%3.2f", $diff_y/$diff_x) }++;
               }
          }
          my $max_slopes = max(values %same_slope, 0) + 1;
          $max = max($max, $same_place, $same_y, $max_slopes);
     }
     return $max;
}

is(max_points([1,1], [2,2], [3,3]), 3, 'Example 1');
is(max_points([1,1], [2,2], [3,1], [1,3], [5,3]), 3, 'Example 2');
done_testing();
