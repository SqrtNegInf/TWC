#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics 'combinations';
use List::Util 'all';

my @ARGV = (2, 7, 9, 2);

my $k = pop @ARGV;

my $combo = combinations([keys @ARGV], 2);

while (my $indices = $combo->next) {
    my ($i, $j) = $indices->@*;
    say "$j,$i" if $ARGV[$j] - $ARGV[$i] == $k;
}
