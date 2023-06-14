#!/usr/bin/env perl
use v5.36;

sub base {
    my ($number, $base) = @_;
    my @digits = (0 .. 9, 'A' .. 'Z');
    my @result;
    while ($number > ($base - 1)) {
        my $digit = $number % $base;
        push @result, $digits[$digit];
        $number /=  $base;
    }
    push @result, $digits[$number];

    return join '', reverse @result;
}

my $base = 10;

if (grep { $base == $_} ( 1, 2, 3, 6)) {
    die "There is no descriptive number for base $base\n";
}

say base(($base - 4) * ($base ** ($base - 1)) + (2 * $base ** ($base - 2)) +
    ($base ** ($base - 3)) + $base ** 3, $base);
