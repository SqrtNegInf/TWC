#!/usr/bin/env perl
use v5.36;

use ntheory qw/is_prime/;

my $prime_rev;

for (my $n = 1; $n < 1000; $n++){
  if (is_prime($n)) {
    $prime_rev = reverse($n);
    if ((is_prime($prime_rev)) && ($n == $prime_rev)){
      print "$n ";
    }
  }
}

say " ";
