#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce);

my @sorted=sort {$a<=>$b} (1, 3, 8, 2, 0);
say +(reduce {$b>$a?$b:$a} map {$sorted[$_+1]-$sorted[$_]} 0..$#sorted-1)//0,
    join ' ', '<-(', @ARGV, ')',
