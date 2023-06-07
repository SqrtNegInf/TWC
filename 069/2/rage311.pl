#!/usr/bin/env perl
use v5.36;

sub zero_one ($i, $iterations = 30, $string = '') {
  (my $tmp = reverse $string) =~ tr/01/10/;
  $string .= '0' . $tmp;
  return $string if $i == $iterations;
  return zero_one(++$i, $iterations, $string);
}

say zero_one(1, 7);
