#!/usr/bin/env perl
use v5.36;
srand 1;

use List::Util qw(shuffle);

my $N = 20;

my @a = make_array($N);
my @p = peaks(@a);

$" = ", ";
say "Array: [@a[1..$#a-1]]";
say "Peak:  [@p]";

sub make_array($N) {
    my @a = shuffle 1..50;
    return (0, @a[0..$N-1], 0);
}

sub peaks(@a) {
    my @p;
    for my $i (1..$#a-1) {
        push @p, $a[$i] if $a[$i-1] < $a[$i] > $a[$i+1];
    }

    return @p;
}
