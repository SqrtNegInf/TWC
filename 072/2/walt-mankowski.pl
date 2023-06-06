#!/usr/bin/env perl
use v5.36;

my ($fname, $a, $b) = ('input.txt',3,6);

open my $f, '<', $fname;
while (<$f>) {
    print if $a == $. .. $b == $.;
}
