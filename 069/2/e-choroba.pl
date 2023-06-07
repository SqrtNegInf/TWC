#!/usr/bin/env perl
use v5.36;

sub next_s {
    $_[0] . '0' . reverse($_[0]) =~ tr/01/10/r;
}

my $s = "";

$s = next_s($s) for 1 .. 7;
say $s;
