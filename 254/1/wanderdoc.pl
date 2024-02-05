#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -srand => 1;

sub is_power_of_N
{
     my ($num, $N) = @_;
     return 0 if ( $num < 1 );
     while ( $num % $N == 0 )
     {
          $num /= $N;
     }
     if ( 1 == $num )
     {
          return 1;
     }
     return 0;
}

is(is_power_of_N(27, 3), 1, 'Example 1');
is(is_power_of_N( 0, 3), 0, 'Example 2');
is(is_power_of_N( 6, 3), 0, 'Example 3');

done_testing();
