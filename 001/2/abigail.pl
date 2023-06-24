#!/usr/bin/env perl
use v5.36;

for (20) {
    foreach my $number (1 .. $_) {
        say $number % 15 == 0 ? "fizzbuzz"
          : $number %  5 == 0 ? "buzz"
          : $number %  3 == 0 ? "fizz"
          :                      $number
    }
}
