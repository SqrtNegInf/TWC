#!/usr/bin/env perl
use v5.36;

my @primes = (2, 3);
my @strong;
my @weak;

my $n = 5;
while (@strong < 10 || @weak < 10) {
    if (is_prime($n)) {
        push @primes, $n;
        my $avg = ($primes[-1] + $primes[-3]) / 2;
        if ($primes[-2] > $avg) {
            push @strong, $primes[-2];
        } elsif ($primes[-2] < $avg) {
            push @weak, $primes[-2];
        }
    }
    $n += 2;
}

$" = ", ";
say "Weak primes: @weak[0..9]";
say "Strong primes: @strong[0..9]";

sub is_prime($n) {
    for my $i (3..sqrt($n)) {
        return 0 if $n % $i == 0;
    }
    return 1;
}
