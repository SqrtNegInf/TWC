#!/usr/bin/env perl
use v5.36;

my @l = (1,1);

for (2..19) {
    $l[$_] = $l[$_-2] + $l[$_-1]+1;
}

print "@l\n";
