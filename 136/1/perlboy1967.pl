#!/usr/bin/env perl
use v5.36;


# Unbuffered STDOUT
$|++;

use Scalar::Util qw(looks_like_number);

my ($M, $N) = (8, 24);

die "Please provide two positive integer numbers"
  unless (looks_like_number($M) and $M > 0 and $M == int($M) and
          looks_like_number($N) and $N > 0 and $N == int($N));

my $gcd = gcd($M,$N); 
my $exponent = log($gcd)/log(2);
my $isTwoFriendly = (int($exponent) == $exponent) && ($exponent > 0);

printf "Input: m = %d, n = %d\n", $M, $N;
printf "Output: %d\n", $isTwoFriendly;
printf "Reason: gcd(%d,%d) = %d %s\n", $M, $N, $gcd, 
        ($isTwoFriendly ? sprintf(' => 2 ^ %d', $exponent) : '');


sub gcd {
  return 0 == $_[1] ? $_[0] : gcd($_[1], $_[0] % $_[1]);
} 
