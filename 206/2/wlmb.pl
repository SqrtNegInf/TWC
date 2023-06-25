#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

my @A = <1 2 3 4>;
my $i = 0; # counter
my $max = sum          # sum
    map {$i++%2?():$_} # every second element
    sort {$a<=>$b}     # of the sorted (ascending)
    @A;                # input
say join " ", @A, "->", $max;
