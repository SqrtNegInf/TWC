#!/usr/bin/env perl
use v5.36;

my $big_prime           = 1_000_000_007;
my $total_count_set_bit = 0;

for my $n (1 .. 4) {    # or $ARGV[0]
  $total_count_set_bit += sprintf("%b", $n) =~ tr/1//;
  $total_count_set_bit %= $big_prime;
}

say $total_count_set_bit;
