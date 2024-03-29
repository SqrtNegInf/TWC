#!/usr/bin/env perl
use v5.36;

use Test::More;

sub check_power # Challenge 066. :-)
{
     my $num = $_[0];
     for my $i ( 2 .. sqrt($num) )
     {

          next if $num % $i; # Bartosz Jarzyna in challenge-066.
          my $result = $i;

          while ( $result < $num )
          {
               $result *= $i;

               return 1 if $result == $num;
          }
     }
     return 0;
}







is(check_power(9), 1, 'Example 1');
is(check_power(15), 0, 'Example 2');
is(check_power(125), 1, 'Example 3');

is(check_power(100000004987), 0, 'Big prime');
is(check_power(200000), '0', 'Even number');

done_testing();
