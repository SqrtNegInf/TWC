#!/usr/bin/env perl
use v5.36;

my ($n,$e,$d) = ($ARGV[0] || 9 , 0, 2);

while ($d < 1+sqrt $n) {
    ( $e = ((log $n) / (log $d))  ) !~ /\./ ? last : $d++;
}

say $e =~ /\./ ? 0 : "$d^$e"
