#!/usr/bin/env perl
use v5.36;

my $n = 4;
my @S = (0, 1, 3, 2);

for my $i (3..$n) {
    @S = gray_code($i, @S);
}

say "@S";

sub gray_code($n, @S) {
    return @S, reverse map { 2**($n-1) + $_ } @S;
}
