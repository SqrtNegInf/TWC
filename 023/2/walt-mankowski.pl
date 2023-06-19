#!/usr/bin/env perl
use v5.36;

my $N = 11111;
my $n = $N;
my @p = primes_upto($n);
my @factors;
for my $p (@p) {
    while ($n % $p == 0) {
        push @factors, $p;
        $n /= $p;
    }
}
printf "%d = %s\n", $N, join "*", @factors;

# compute primes up to $n using the Sieve of Eratosthenes
sub primes_upto($n) {
    my @is_prime = map {1} (0..$n);
    $is_prime[0] = $is_prime[1] = 0;

    for my $i (2..$n) {
        if ($is_prime[$i]) {
            for (my $j = $i * 2; $j <= $n; $j += $i) {
                $is_prime[$j] = 0;
            }
        }
    }
    return grep {$is_prime[$_]} 2..$n;
}
