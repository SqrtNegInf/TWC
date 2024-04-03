#!/usr/bin/env perl
use v5.36;

use Test::More;

is(count_equal_divisible([3,1,2,2,2,1,3], 2), 4, 'Example 1');
is(count_equal_divisible([1,2,3], 1), 0, 'Example 2');
done_testing();


sub count_equal_divisible
{
     my ($aref, $k) = @_;
     my @output;
     for my $i ( 0 .. $#$aref - 1 )
     {
          for my $j ( $i + 1 .. $#$aref )
          {
               if ( ($aref->[$i] == $aref->[$j]) and 
                    (($i * $j) % $k == 0) )
               {
                    push @output, [$i, $j];
               }
          }
     }

     return scalar @output; # @output;
}
