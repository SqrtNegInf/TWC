#!/usr/bin/env perl

use strict;
use warnings;
#use Data::Dumper;

my @l = (1,1);

for (2..19) {
    $l[$_] = $l[$_-2] + $l[$_-1]+1;
}

print "@l\n";
#warn Dumper @l;
