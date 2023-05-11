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

    return 0 + (join '', reverse @result);
}

my $n =7;

for my $B (2 .. $n - 2) {
    my @digits = split //, base($n, $B);
    if (!grep { $_ != $digits[0] } @digits) {
        say 1;
        exit;
    }
}

say 0;
