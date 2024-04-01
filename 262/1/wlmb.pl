#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

my @ARGV = (-3, 1, 2, -1, 3, -2, 4);
my @count=(0,0);
$count[$_>=0//0]++ for @ARGV;
say "@ARGV -> ", max @count;
