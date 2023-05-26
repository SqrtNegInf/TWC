#!/usr/bin/env perl
use v5.36;
use 5.020;
use warnings;

my (%first, %last);

for my $arg (('abc', 'dea', 'cd')) {
    $first{substr($arg, 0, 1)} = 1;
    $last{substr($arg, -1, 1)} = 1;
}

for my $key (keys %first) {
    unless (exists $last{$key}) {
        say 0;
        exit;
    }
}
say 1;

