#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum/;

my @nivens = grep {
    $_ and not $_ % sum split //;
} 0..50;

print join("\n", @nivens), "\n";
