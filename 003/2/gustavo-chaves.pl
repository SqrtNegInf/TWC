#!/usr/bin/env perl
use v5.36;

my @row = (1);

for (1 .. 10) {
    say join(' ', @row);
    @row = (1, (map {$row[$_-1] + $row[$_]} 1 .. @row-1), 1);
}

