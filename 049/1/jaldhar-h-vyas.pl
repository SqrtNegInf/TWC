#!/usr/bin/env perl
use v5.36;

my $num = 55;
my $multiple = $num;

while ($multiple !~ / \A [01]+ \z /gmx) {
    $multiple += $num;
}

say $num, ' x ', $multiple / $num, ' = ', $multiple;
