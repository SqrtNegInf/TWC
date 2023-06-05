#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw [is_prime];

#
# The Goldbach conjecture says that every even number greater than 2
# is the sum of two primes. This has been verified for numbers up to
# 4 * 10^18. We will assume it's always true.
#
# This means the answer is:
#
#   No answer, if the number is less than 2;
#   1, if the number is prime;
#   2, if the number is even, or 2 more than a prime number;
#   3, otherwise.
#

while (<DATA>) {
    chomp;
    say  $_ < 2                            ? "No answer possible"
      :                  is_prime ($_)     ? 1
      : ($_ % 2 == 0) || is_prime ($_ - 2) ? 2
      :                                      3;
}

__END__
9
17
19
23
45
56
88
77
95
35
123456791467
123456791468
123456791469
123456791471
778899226751
778899226752
778899226753
778899226755
