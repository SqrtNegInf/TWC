#!/usr/bin/env perl
use v5.36;

my ($s, $c, $o) = ('perlandraku', 3, 4);
my $n = length $s;
die "Invalid values" if $c < 1 or $o < 1 or $c + $o > $n;
for my $i (1..$c) {
    my $tmp = substr $s, $i % $n, 1;
    substr($s, $i % $n, 1) = substr $s, ($i + $o) % $n, 1;
    substr($s, ($i + $o) % $n, 1) = $tmp;
}
say $s;
