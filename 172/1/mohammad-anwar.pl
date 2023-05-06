#!/usr/bin/env perl
use v5.36;
use Test2::V0 -srand => 1;
use experimental qw(builtin);
use builtin   qw(true false);
use Algorithm::Combinatorics qw(combinations);

is prime_partition(18, 2), [5, 13],    'Example 1';
is prime_partition(19, 3), [3, 5, 11], 'Example 2';

done_testing;

#
#
# METHODS

sub is_prime($n) {
    return false if ($n == 1);
    do { return false unless $n % $_ } for (2 .. sqrt $n);
    return true;
}

sub prime_upto($m) {
    my @p = ();
    my $i = 1;
    while ($i <= $m) {
        $i += 2;
        next unless is_prime $i;
        push @p, $i;
    }

    return \@p;
}

sub prime_partition($m, $n) {
    my $primes = prime_upto $m;
    foreach my $combination (combinations($primes, $n)) {
        my $sum = 0;
        $sum += $_ for @$combination;
        return $combination if $sum == $m;
    }
    return;
}
