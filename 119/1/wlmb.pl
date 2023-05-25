#!/usr/bin/env perl
use v5.36;
map {
    die "Keep to range 0-255" unless 0<=$_<=255;
    my $s=my $o=sprintf("%08b", $_);
    $s=~s/^(.{4})(.{4})$/$2$1/;
    say sprintf("Input: %s (%s), Output: %s(%s)", $_,$o, oct("0b$s"), $s)
} (101, 18);
