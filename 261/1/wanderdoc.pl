#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use Test2::V0 -srand => 1;

is(sum_diff(1,2,3,45), 36, 'Example 1');
is(sum_diff(1,12,3), 9, 'Example 2');
is(sum_diff(1,2,3,4), 0, 'Example 3');
is(sum_diff(236, 416, 336, 350), 1296, 'Example 4');


done_testing();

sub sum_diff
{
     my @arr = @_;
     my $elm_sum = sum(@arr);
     my $dig_sum = sum(map digit_sum($_), @arr); 
     my $diff = abs($elm_sum - $dig_sum);
     return $diff;
     
}

sub digit_sum
{
     my $num = $_[0];
     my @arr = split(//, $num);
     my $sum = sum(@arr);
     return $sum;
}
