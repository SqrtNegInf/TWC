#!/usr/bin/env perl
use v5.36;

# calculate the prime factors of a number
sub prime_factors {
    my $n = shift;
    my @factors = ();
    my $i = 2;
    while ($n > 1) {
        while ($n % $i == 0) {
            push @factors, $i;
            $n /= $i;
        }
        $i++;
    }
    return @factors;
}

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

# calculate the home prime of a number
# In number theory, the home prime HP(n) of an integer n greater than 1 is the prime number obtained by repeatedly factoring the increasing concatenation of prime factors including repetitions.
sub home_prime {
    my $n = shift;

    return $n if is_prime($n);
    return home_prime(join '', prime_factors($n));
}

# a version of home_prime that produces debug output at every step
#sub home_prime_debug {
#    my $n = shift;
#
#    say "n = $n";
#    return $n if is_prime($n);
#    my @factors = prime_factors($n);
#    say "factors = @factors";
#    return home_prime_debug(join '', @factors);
#}

use Test::More;
is_deeply [prime_factors(10)], [2, 5];
is_deeply [prime_factors(13)], [13];
is_deeply [prime_factors(14)], [2, 7];

is home_prime(10), 773;
#is home_prime_debug(10), 773;
done_testing;
