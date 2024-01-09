#!/usr/bin/env perl
use v5.36;

my $maxvalue = -Inf;

for my $str (@ARGV) {
    my $value = ($str =~ /^\d+$/) ? 0 + $str : length $str;
    if ($value > $maxvalue) {
        $maxvalue = $value;
    }
}

say $maxvalue;
