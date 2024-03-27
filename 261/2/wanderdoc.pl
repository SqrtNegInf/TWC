#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

is(multiply_by_two([5,3,6,1,12], 3), 24, 'Example 1');
is(multiply_by_two([1,2,3,4], 1), 8, 'Example 2');
is(multiply_by_two([5,6,7], 2), 2, 'Example 3');
done_testing();

sub multiply_by_two
{
     my ($aref, $start) = @_;
     my $scalar;
     vec($scalar, $_, 1) = 1 for @$aref;
     while ( vec($scalar, $start, 1) == 1 )
     {
          $start *= 2;
     }
     return $start;
}
