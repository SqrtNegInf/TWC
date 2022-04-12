#!/usr/bin/env perl
use warnings;
use strict;
use 5.010;

my $num = 55;
my $multiple = $num;

while ($multiple !~ / \A [01]+ \z /gmx) {
    $multiple += $num;
}

say $num, ' x ', $multiple / $num, ' = ', $multiple;
