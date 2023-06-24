#!/usr/bin/env perl
use v5.36;

my $size = -s $0;
use bigint;
my $n = 10 ** ($size+5) * 2;
my $p = 4 * $n;
my $i = 0;
while ($n) {
    $p += $n;
    $i += 1;
    $n *= $i;
    $n = $n /(2 * $i + 1);
}

say "File Size: $size Bytes";
say "PI ($size-digits): 3.".substr $p,2,$size-1;
