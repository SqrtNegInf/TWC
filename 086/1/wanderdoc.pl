#!/usr/bin/env perl
use v5.36;

use Test::More;

sub pair_diff
{
     my ($aref, $num) = @_;
     @$aref = sort {$a <=> $b} @$aref;


     my $i = 0;

     my $j = 1;
     while ( $i <= $#$aref and $j <= $#$aref )
     {
          if ( $aref->[$j] - $aref->[$i] == $num )
          {
               return 1;
          }
          elsif ( $aref->[$j] - $aref->[$i] < $num  or $j == $i)
          {
               $j++;
          }



          else
          {
               $i++;
          }
     }
     return 0;
}

is(pair_diff([10,  8, 12, 15,  5],  7), 1, 'Example 1');
is(pair_diff([ 1,  5,  2,  9,  7],  6), 1, 'Example 2');
is(pair_diff([10, 30, 20, 50, 40], 15), 0, 'Example 3');
done_testing();
