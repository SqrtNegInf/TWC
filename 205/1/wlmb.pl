#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniqint);

my @A = (5,4,4,3);

die <<~"FIN" unless @A;
    Usage: $0 N1 [N2...]
    to find the third highest number from the list N1 N2...
    FIN
my @list=(sort {$b<=>$a} uniqint @A); # filter out repetitions and sort descending
push @list, ($list[0]) x 2; # Add two copies of the maximum at the end of the list
say join " ", @A, "->", $list[2];
