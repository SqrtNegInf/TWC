#!/usr/bin/env perl
use v5.36;

sub min {
    my ($a, $b) = @_;

    return $a < $b ? $a : $b;
}

my $T = shift //  '03:10';
my ($hours, $mins) = split q{:}, $T;

my $hangle = ($hours % 12) * 30 + ($mins / 60 ) * 30;
my $mangle = $mins * 6;
my $diff = abs($hangle - $mangle);
my $angle = min($diff, 360 - $diff);

say "$angle degree", ($angle != 1 ? 's' : q{});

