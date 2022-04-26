#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

my ($n, @list) = (1, (5, 9, 2, 8, 1, 6));

(@list = map $list[$_]-$list[$_-1],1..$#list) for 1..$n;

say "@list";
