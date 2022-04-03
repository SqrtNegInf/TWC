#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my ($s, $c, $o) = ('perlandraku', 3, 4);
my $n = length($s);

for my $i (1..$c) {
    (substr($s, $i % $n,        1), substr($s, ($i + $o) % $n, 1)) =
    (substr($s, ($i + $o) % $n, 1), substr($s, $i % $n,        1));
}

say $s;
