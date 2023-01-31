#!/usr/bin/env perl

use v5.24;
use warnings;
use experimental 'signatures';
no warnings 'experimental::signatures';

say for missing_numbers( (0, 1, 3, 5, 9, 10) );

sub missing_numbers (@array) {
   my %set = map { $_ => 1 } @array;
   grep { ! exists($set{$_}) } 0 .. @array;
}
