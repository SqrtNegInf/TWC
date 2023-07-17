#!/usr/bin/env perl
use v5.36;

use List::Util qw(reductions);

my @input = (0, 10, 4, 8, 3, 0);
my $last_index=@input-3;
my ($left, $right) = map {[reductions {$a+$b} @$_]}
    [@input[0..$last_index]], [((reverse @input)[0..$last_index])];
my @output = map {abs($left->[$_] - $right->[-$_-1])} 0..$last_index;
say "@ARGV -> @output";
