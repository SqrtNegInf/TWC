#!/usr/bin/env perl
use v5.36;

my $n = shift // 1234567;

$n =~ s/^\-//;

if ($n !~ /^\d+$/) {
    die "Not an integer.\n";
}

my $len = length $n;

if ($len % 2 == 0) {
    die "Even number of digits\n";
}

if ($len < 3) {
    die "Too short.\n";
}

say substr $n, ($len - 3) / 2, 3;
