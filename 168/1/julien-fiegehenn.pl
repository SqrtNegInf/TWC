#!/usr/bin/env perl
use v5.36;

sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    return 1 if $n == 2;
    return 0 if $n % 2 == 0;
    for (my $i = 3; $i <= sqrt($n); $i += 2) {
        return 0 if $n % $i == 0;
    }
    return 1;
}

sub perrin_primes {
    my $n = shift;
    my %primes = map { $_ => 1 } 2, 3;
    my @perrin = (3, 0, 2);
    my $i = 3;
    while (keys %primes < $n) {
        $perrin[$i] = $perrin[$i - 2] + $perrin[$i - 3];
        if (is_prime($perrin[$i])) {
            $primes{$perrin[$i]} = 1;
        }
        $i++;
    }
    return sort { $a <=> $b } keys %primes;
}

my @primes = perrin_primes(13);
say "@primes";
