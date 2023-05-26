#!/usr/bin/env perl
use v5.36;

sub higher_integer_set_bits ($N) {
   sub n_bits ($x) { sprintf('%b', $x) =~ tr/1/1/ };
   my $initial = n_bits($N);
   while ('necessary') {
      ++$N;
      return $N if $initial == n_bits($N);
   }
}

@ARGV = 12 unless @ARGV;
say higher_integer_set_bits($_) for @ARGV;
