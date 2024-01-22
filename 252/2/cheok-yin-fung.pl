#!/usr/bin/env perl

use v5.30.0;
use warnings;

use List::Util qw/sum/;
use Algorithm::Combinatorics qw/combinations/;

sub sz {
    my $n = $_[0];
    die "Invalid n\n" if $n <= 0;
    my $lower = $_[1] || -$n;
    my $upper = $_[2] || $n;
    my @arr = ($lower..$upper);
    my $iter = combinations(\@arr, $n);
    while (my $c = $iter->next) {
        my @com = $c->@*;
        say "@com" if 0 == sum @com;
    }
}

sz @ARGV || (5,-5,4);
