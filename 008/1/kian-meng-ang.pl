#!/usr/bin/env perl
use v5.36;

use Const::Fast;
use Math::Prime::Util qw(prime_iterator is_prime);

const my $TOTAL_PERFECT_NUMBERS => 5;

my $iter = prime_iterator;
my @perfect_numbers = ();

while (scalar @perfect_numbers < $TOTAL_PERFECT_NUMBERS) {
    my $prime_number = $iter->();

    my $mersenne_prime = 2 ** $prime_number - 1;
    next if (!is_prime($mersenne_prime));

    push @perfect_numbers, (2 ** ($prime_number - 1)) * $mersenne_prime;
}

say join q|, |, @perfect_numbers;
