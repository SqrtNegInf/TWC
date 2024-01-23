#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

sub special_numbers{
  my ($arr) = @_;
  sum0 map{($arr->[$_] ** 2) if @$arr % ($_+1) == 0} 0..$#$arr;
}

printf "%d\n",special_numbers([1,2,3,4]);
printf "%d\n",special_numbers([2,7,1,19,18,3]);
