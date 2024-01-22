#!/usr/bin/env perl
use v5.36;

for(5){
    warn("Input must be greater than one"), next unless $_>=1;
    say "$_ -> [", join(" ", -$_/2..-1, $_%2?(0):(), 1..$_/2), "]";
}
