#!/usr/bin/env perl
use v5.36;

# Sieve of Eratosthenes
my @sieve;
my @primes;

my($n) = 125;
say is_perfect_power($n);


sub is_perfect_power {
    my($n) = @_;
    find_primes($n);            # fill list of prime numbers up to sqrt(n)
    for my $prime (@primes) {
        my $exp = 1;
        my $power;
        while (($power = $prime ** $exp) <= $n) {
            if ($power == $n) {
                return 1;
            }
            $exp++;
        }
    }
    return 0;
}

sub find_primes {
    my($n) = @_;
    my $prime = 2;
    do {
        push @primes, $prime;
        for (my $f = $prime*2; $f*$f <= $n; $f += $prime) {
            $sieve[$f] = 1;
        }
        do {
            $prime++
        } while ($prime*$prime < $n && $sieve[$prime]);
    } while ($prime*$prime < $n);
}
