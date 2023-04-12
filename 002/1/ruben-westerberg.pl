#!/usr/bin/env perl

use v5.36; 
no warnings 'uninitialized'; # Use of uninitialized value $1 in string ne at ruben-westerberg.pl line 7.

$_= "010, 02, 0343";

s/(\-|\+)?(0+)(\d*\.?\d+)/($1 ne "-") ? ($1 \/\/ "").$3:$&/ge;
print $_;
