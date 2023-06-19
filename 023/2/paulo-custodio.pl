#!/usr/bin/env perl
use v5.36;

my($n) = 11111;
say join(", ", prime_decomposition($n));


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


sub prime_decomposition {
    my($n) = @_;
    return ($n) if $n <= 2;     # special cases

    my @f;                      # factors
    my $p = 2;                  # first prime
    while ($n > 1) {
        if ($n % $p == 0) {
            push @f, $p;
            $n /= $p;
        }
        else {
            $p = next_prime($p);
        }
    }

    return @f;
}
