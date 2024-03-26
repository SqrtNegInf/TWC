#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

my @ARGV = (1, 2, 3, 45);
say "@ARGV -> ", sum0 map {$_-sum0 split""} @ARGV;
