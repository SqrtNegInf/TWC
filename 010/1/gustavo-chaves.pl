#!/usr/bin/env perl
use v5.36;

my %powers = (
    M => 1000,
    D => 500,
    C => 100,
    L => 50,
    X => 10,
    V => 5,
    I => 1,
);

my @powers =
    map {[$_ => $powers{$_}]}
    sort {$powers{$b} <=> $powers{$a}}
    keys %powers;

sub arabic_to_roman {
    my ($arabic) = @_;

    my $roman = '';

    foreach my $power (@powers) {
        use integer;
        my ($letter, $base) = @$power;
        if (my $multiple = $arabic / $base) {
            $roman .= $letter x $multiple;
        }
        $arabic %= $base;
    }

    return $roman;
}

sub roman_to_arabic {
    my ($roman) = @_;

    my $arabic = my $accumulator = 0;
    my $last_power = 10000;     # greater than the biggest power

    foreach my $letter (split //, $roman) {
        my $power = $powers{$letter};
        if ($power < $last_power) {
            $arabic += $accumulator;
            $accumulator = $power;
        } elsif ($power == $last_power) {
            # additive notation
            $accumulator += $power;
        } else {
            # subtractive notation
            $arabic += $accumulator - 2 * $last_power + $power;
            $accumulator = 0;
        }
        $last_power = $power;
    }
    $arabic += $accumulator;

    return $arabic;
}

say arabic_to_roman(56);
say roman_to_arabic('LVI');
