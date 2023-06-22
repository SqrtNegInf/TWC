#!/usr/bin/env perl
use v5.36;

my @F = (1);
my @M = (0);

sub F {
    my $n = int(shift);
    exit if $n < 0;

    return $F[$n] if defined $F[$n];

    $F[$n] = $n - M(F($n - 1));
}

sub M {
    my $n = int(shift);
    exit if $n < 0;

    return $M[$n] if defined $M[$n];

    $M[$n] = $n - F(M($n - 1));
}

my $n = 19;

print(F($_), ' ') for 0 .. $n - 1;
say '';

print(M($_), ' ') for 0 .. $n - 1;
say '';
