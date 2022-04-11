#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my @list = sort {$a - $b } (19,11,9,7,20,3,17,16,2,14,1);

for my $i (0..~-@list) {
    say $list[$i] if ~-@list-$i == $list[$i]
}
