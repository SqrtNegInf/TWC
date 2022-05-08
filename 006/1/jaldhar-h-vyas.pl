#!/usr/bin/env perl
use warnings;
use strict;
use 5.010;
use English qw/ -no_match_vars /;

my @numbers = sort { $a <=> $b } split /,/, '1,2,3,4,9,10,14,15,16';
my $lastelem = scalar @numbers - 1;
my @ranges;
my $start;
my $current = 0;

while ($current <= $lastelem) {
    $start = $current;

    while ($current < $lastelem &&
    $numbers[$current] + 1 == $numbers[$current + 1]) {
        $current++;
    }

    if ($numbers[$current] == $numbers[$start]) {
        push @ranges, $numbers[$start];
    } elsif ($numbers[$current] == $numbers[$start] + 1) {
        push @ranges, $numbers[$start], $numbers[$current];
    } else {
        push @ranges, "$numbers[$start]-$numbers[$current]";
    }

    $current++;
}

say join q{,}, @ranges;
