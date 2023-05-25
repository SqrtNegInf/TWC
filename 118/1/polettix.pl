#!/usr/bin/env perl
use v5.36;

sub binary_palindrome ($N) {
   die "invalid $N (positive integers are OK)\n"
      if $N !~ m{\A [1-9]\d* \z}mxs;
   return unless $N % 2;
   my ($M, $n) = (0, $N);
   ($M, $n) = (($M << 1) | ($n & 1), $n >> 1) while $n > 0;
   return $M == $N;
}

my @args = @ARGV ? @ARGV : 1 .. 31;
say $_, ' -> ', binary_palindrome($_) ? 1 : 0 for @args;
