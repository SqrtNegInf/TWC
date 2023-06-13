#!/usr/bin/env perl
use v5.36;

my $n = 55;

my $multiple = $n;
while ($multiple !~ /^[01]+$/) {
    $multiple += $n;
}

say $multiple;
