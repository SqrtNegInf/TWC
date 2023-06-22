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

sub euclid_iter {
    my $prime = 1;
    my $prime_prod = 1;
    return sub {
        $prime = next_prime($prime);
        $prime_prod *= $prime;
        return $prime_prod+1;
    };
}

my $iter = euclid_iter();
my $p;
1 while (is_prime($p = $iter->()));
say $p;
