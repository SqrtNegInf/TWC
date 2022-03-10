#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $n = 1234;

while (1) {
  ++$n;

  if ($n == reverse $n) {
    say $n;
    last;
  }
}

sub get_arg {
  if (!@ARGV or $ARGV[0] =~ /\D/) {
    die "Give me a positive integer\n";
  }

  return $ARGV[0];
}
