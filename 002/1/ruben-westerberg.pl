#!/usr/bin/env perl
use v5.36; 

no warnings 'uninitialized';

$_= "010, 02, 0343";

s/(\-|\+)?(0+)(\d*\.?\d+)/($1 ne "-") ? ($1 \/\/ "").$3:$&/ge;
print $_;
