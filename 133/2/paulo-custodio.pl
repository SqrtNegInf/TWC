#!/usr/bin/env perl
use v5.36;

use ntheory 'factor', 'is_prime';
use List::Util 'sum';

my $n = 1;
my $count = 0;
while ($count < 10) {
    $n++;
    if (is_smith($n)) {
        say $n;
        $count++
    }
}

sub is_smith {
    my($n) = @_;
    return if is_prime($n);
    my @digits = split //, $n;
    my $sum1 = sum(@digits);
    my @fact_digits = split //, join '', factor($n);
    my $sum2 = sum(@fact_digits);
    return $sum1 == $sum2;
}
