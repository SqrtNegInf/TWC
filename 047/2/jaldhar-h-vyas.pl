#!/usr/bin/env perl
use v5.36;

my @gapfuls;
my $number = 100;

while (scalar @gapfuls != 20) {
    my @digits = split //, $number;
    my $divisor = join q{}, ($digits[0], $digits[-1]);
    if ($number % $divisor == 0) {
        push @gapfuls, $number;
    }
    $number++;
}

say join ', ', @gapfuls;
