#!/usr/bin/env perl
use v5.36;

my @arr;
for (1..99) {
    push @arr, $_ if ($_ + (scalar reverse $_) ) =~ /^[13579]+$/ ;
}

say join ", ", @arr;

