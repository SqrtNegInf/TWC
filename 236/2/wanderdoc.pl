#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);
use Test2::V0 -srand => 1;

my @answers =
(
     [
       [4, 15, 1, 6, 13, 5, 0],
       [3, 8, 7, 18, 9, 16, 12, 17, 2],
       [14, 11, 19, 10],
     ],
     [
       [0],
       [1],
       [13, 9, 14, 17, 18, 15, 5, 8, 2],
       [7, 11, 4, 6, 10, 16, 3],
       [12],
       [19],
     ],
     [
       [9, 4, 5, 7, 19, 17, 15, 1, 8, 12, 18, 6, 13, 2, 3, 11, 10, 14, 16, 0],
     ]
);


sub count_loops
{
     my @arr = @_;
     die "Not all values are unique!$/" unless @arr = uniq @arr;
     my $max_idx = $#arr;
     my @output;
     my %val_used;
     BIG_LOOP: for my $i ( 0 .. $#arr )
     {
          my $start_value = $arr[$i];
          next if $val_used{$start_value};
          my @loop;
          if ( $start_value == $i )
          {
               push @output, [$start_value];
               $val_used{$start_value}++;
          }
          else
          {
               my %this_loop_values;
               push @loop, $start_value;
               $this_loop_values{$start_value}++;
               while ( $#loop <= $max_idx )
               {
                    my $next_value = $arr[$start_value];
                    if ( $this_loop_values{$next_value} )
                    {
                         push @output, [@loop];
                         $val_used{$_}++ for @loop;
                         next BIG_LOOP;
                    }
                    else
                    {
                         $this_loop_values{$next_value}++;
                         push @loop, $next_value;
                         $start_value = $next_value;
                    }
               }
          }
     }
     return @output;
}

is([count_loops(4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10)], $answers[0], 'Example 1');
is([count_loops(0,1,13,7,6,8,10,11,2,14,16,4,12,9,17,5,3,18,15,19)], $answers[1], 'Example 2');
is([count_loops(9,8,3,11,5,7,13,19,12,4,14,10,18,2,16,1,0,15,6,17)], $answers[2], 'Example 3');
done_testing();
