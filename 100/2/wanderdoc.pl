#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);
use Test::More;

sub triangle_path
{
     my $aref = $_[0];
     my $mtr;

     do { my $i = $_;
          do { $mtr->[$i][$_] = 0 } for 0 .. $#$aref }
          for 0 .. $#$aref;
     $mtr->[$#$aref] = $aref->[$#$aref];
     
     for my $i ( reverse 0 .. $#$aref - 1 )
     {
          my $row = $aref->[$i];

          for my $j (0 .. $#$row)
          {
               my $left = $mtr->[$i + 1][$j];


               my $right = $mtr->[$i + 1][$j + 1];
               $mtr->[$i][$j] = $row->[$j] + min($left, $right);
          }

     }
     return $mtr->[0][0];
}


is(triangle_path([[1], [2,4], [6,4,9], [5,1,7,2]]), 8, 'Example 1');;
is(triangle_path([[3], [3,1], [5,2,3], [4,3,1,3]]), 7, 'Example 2');;
done_testing();
