#!/usr/bin/env perl
use v5.36;

use Math::Primality qw(is_prime);

my @pN;

my $i = 1;
while (scalar @pN < 10) {
  push(@pN,$i) if (is_prime(scalar(grep/1/,split(//,sprintf('%b',$i)))));
  $i++;
}

say join(',',@pN);
