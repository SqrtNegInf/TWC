#!/usr/bin/env perl
use v5.36;

sub number_operations {
    my %ints = map { $_ => 1} grep $_ > 0, @_;
    return scalar %ints;
}

for my $test ([<1 5 0 3 5>], [(0,)], [<2 1 4 0 3>]) {
    printf "%-10s => ", "@$test";
    say number_operations @$test;
}
