#!/usr/bin/env perl
use v5.36;

my ( $begin, $end ) = (111,999);
($begin, $end) = ($end, $begin) if $end < $begin;

for ($begin .. $end) {
    my @d = split //;
    next if abs($d[0] - $d[1]) != 1 ||
            abs($d[1] - $d[2]) != 1;
    say $_;
}
