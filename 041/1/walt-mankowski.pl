#!/usr/bin/env perl
use v5.36;

my $N = 50;

# Find the primes up to $n using the Sieve of Eratosthenes
sub primes_up_to($n) {
    my %primes = map { $_ => 1 } 2..$n;
    for my $i (2..sqrt($n)) {
        if (defined $primes{$i}) {
            for (my $j = $i**2; $j <= $n; $j += $i) {
                delete $primes{$j};
            }
        }
    }
    return %primes;
}

sub prime_factors($n, %primes) {
    my @factors;

    for my $i (sort { $a<=>$b } keys %primes) {
        last if $i > $n;
        while ($n % $i == 0) {
            push @factors, $i;
            $n /= $i;
        }
    }
    return @factors;
}

my %primes = primes_up_to($N);
for my $i (1..$N) {
    say $i if defined $primes{scalar prime_factors($i, %primes)};
}
