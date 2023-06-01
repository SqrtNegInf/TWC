#!/usr/bin/env perl
use v5.36;

my @N = <1 2 1 2>;

my $pos = 0;
while ($pos < $#N && $N[$pos]) {
    $pos += $N[$pos];
}
print((($pos == $#N) ? 1 : 0), "\n");
