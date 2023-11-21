#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -srand => 1;

sub reverse_pairs
{
     my @arr = @_;
     my @output;
     for my $i ( 0 .. $#arr -1 )
     {
          for my $j ( $i + 1 .. $#arr )
          {
               if ( $arr[$i] > 2 * $arr[$j] )
               {
                    push @output, [$i, $j];
               }
          }
     }
     return @output;
}


is([reverse_pairs(1, 3, 2, 3, 1)], [[1,4],[3,4]], 'Example 1');
is([reverse_pairs(2, 4, 3, 5, 1)], [[1,4],[2,4],[3,4]], 'Example 2');
done_testing();
