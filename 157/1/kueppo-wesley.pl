#!/usr/bin/env perl
use v5.36;

use Math::BigFloat;

my @vars = (1,3,5,6,9);

my($mul, $add, $frac) = (1, 0, 0);
foreach (@vars) {
    $mul *= $_;
    $add += $_;
    $frac += 1/$_;
}

$mul = Math::BigFloat->new(abs $mul);
printf "AM = %.1f, GM = %.1f, HM = %.1f\n", $add/@vars, $mul->broot(scalar @vars), @vars/$frac;
