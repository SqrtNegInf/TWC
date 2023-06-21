#!/usr/bin/env perl
use v5.36;

# check if number is prime
sub is_prime {
    my($n) = @_;

    return 0 if $n <= 1;
    return 1 if $n <= 3;

    return 0 if ($n % 2)==0 || ($n % 3)==0;

    for (my $i = 5; $i*$i <= $n; $i += 6) {
        return 0 if ($n % $i)==0 || ($n % ($i+2))==0;
    }

    return 1;
}

# next prime
sub next_prime {
    my($n) = @_;

    return 2 if $n <= 1;
    my $p = $n;
    1 while !is_prime(++$p);
    return $p;
}

sub prime_iter {
    my($strong) = @_;
    my @primes = (1,2,3);       # 1 + first two primes; 1 is discarded on first iteration
    return sub {
        while (1) {
            # get next prime, drop oldest
            shift @primes;
            push @primes, next_prime($primes[-1]);

            my $avg = ($primes[-3]+$primes[-1])/2;
            if ($strong) {
                return $primes[-2] if $primes[-2] > $avg;
            }
            else {
                return $primes[-2] if $primes[-2] < $avg;
            }
        }
    };
}

my $N = shift || 10;

my $iter = prime_iter(1);
say "Strong Prime: ", join(", ", map {$iter->()} 1..$N);

$iter = prime_iter(0);
say "Weak Prime:   ", join(", ", map {$iter->()} 1..$N);
