#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
    10,
    1,
    20,
    7920,
];

sub is_prime
{
    my $n = shift;

    return 0 if $n <= 1;
  
    for my $i (2 .. $n-1) {
        return 0 if ($n % $i) == 0;
    }
  
    return 1;
}
  
sub count_primes
{
    my $n = shift;
    my $c = 0;
    for my $i (2 .. $n) {
        ++$c if is_prime($i);
    }
    return $c;
}

is(count_primes($cases->[0]),    4, 'n = 10');
is(count_primes($cases->[1]),    0, 'n = 1');
is(count_primes($cases->[2]),    8, 'n = 20');
is(count_primes($cases->[3]), 1000, 'n = 7920');
done_testing();

exit 0;
