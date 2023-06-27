#!/usr/bin/env perl
use v5.36;

my $n = 1;
my $count = 0;

do {} until (is_prime(++$n) && ++$count == 10001 && print $n);

sub is_prime {
    my $n = shift;
    #every composite number has a prime factor less than or equal to its square root.
    return 1 == grep {$n % $_ == 0} (1 .. sqrt $n);
}
