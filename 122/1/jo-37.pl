#!/usr/bin/env perl
use v5.36;

$| = 1;

# Provide a stream of numbers.

my $n;
while (($n += 10) < ($ARGV[0] // 100)) {
    say $n;
    sleep 1;
}
