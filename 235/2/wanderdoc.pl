#!/usr/bin/env perl
use strict;
use warnings FATAL=> qw(all);

use Test::More;

sub duplicate_zeros
{
     my @arr = @_;
     my $max_idx = $#arr;
     my @output;
     for my $i ( 0 .. $max_idx )
     {
          push @output, $arr[$i];
          if ( $arr[$i] == 0 )
          {
               push @output, 0;
          }
          if ( $#output > $max_idx )
          {
               return @output[0 .. $max_idx];
          }
     }
     return @output;
}



is_deeply([duplicate_zeros(1, 0, 2, 3, 0, 4, 5, 0)], [(1, 0, 0, 2, 3, 0, 0, 4)], 'Example 1');
is_deeply([duplicate_zeros(1, 2, 3)], [(1, 2, 3)], 'Example 2');
is_deeply([duplicate_zeros(0, 3, 0, 4, 5)], [(0, 0, 3, 0, 0)], 'Example 3');
done_testing();

