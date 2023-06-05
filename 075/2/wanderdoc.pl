#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

sub find_max_rectangle # Algorithm: http://tech-queries.blogspot.com/2011/03/maximum-area-rectangle-in-histogram.html
{

     my @arr = @_;
     my @left; 

     my @right;
     my @width = (1) x scalar @arr;

     for my $i ( 0 .. $#arr )
     {

          while ( scalar @left and $arr[$i] <= $arr[$left[-1]] )
          {
               pop @left;
          }

          if ( 0 == scalar @left )
          {
               $width[$i] += $i;

          }
          else
          {
               $width[$i] += $i - $left[-1] - 1;
          }
          push @left, $i;
     }


     for my $i ( reverse 0 .. $#arr )
     {
          while (scalar @right and $arr[$i] <= $arr[$right[-1]] )
          {
               pop @right;

          }


          if ( 0 == scalar @right )
          {
               $width[$i] += $#arr - $i;
          }
          else
          {
               $width[$i] += $right[-1] - $i - 1;
          }

          push @right, $i;
     }
     my $max = max(map $width[$_] * $arr[$_], 0 .. $#arr);
     return $max;
}

sub print_histogram
{
     my @arr = @_;

     my $max = max(@arr);
     my $offset = length($max); #  + 1;
     for my $high ( reverse 1 .. $max )
     {
          my @hist = map {$_ >= $high ? '#' : ' '} @arr;
          print $high, ' ' x $offset,
               join(' ', @hist), $/;
     }

     my @underl = map '_', @arr, $max;

     print join(' ', @underl), $/;
     print ' ' x ($offset + 1),  join(' ', @arr)   , $/;

}

for my $test ([2, 1, 4, 5, 3, 7], [3, 2, 3, 5, 7, 5])
{
     print_histogram(@$test);
     my $max = find_max_rectangle(@$test);
     print "The largest rectangle area is ${max}.$/";
}
