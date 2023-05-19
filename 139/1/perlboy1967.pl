#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(none slide);

sub jortSort {
  no warnings 'once';
  none{$_<0}(slide{$b-$a}@_);
}

my @n = <1 2 4 3 5>;
printf "(%s) => %d\n", join(',',@n), jortSort(@n) // 'undef';
