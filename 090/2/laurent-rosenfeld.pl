#!/usr/bin/env perl
use v5.36;

my ($c, $d) = (238, 13);
my $result = $c % 2 ? $d : 0;
while ($c > 1) {
    $c = $c >> 1; # right shift 1 bit = div by 2
    $d *= 2;
    $result += $d if $c % 2;
}
say $result;
