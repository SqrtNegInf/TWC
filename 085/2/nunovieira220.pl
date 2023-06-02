#!/usr/bin/env perl
use v5.36;

# Input
my $N = 125;

# Power of Two Integers
my $res = 0;

for my $a (1..$N) {
  my $exp = $a ** 2;
  $res = 1 if($exp == $N);
  last if ($exp >= $N);

  for (3..$N) {
    my $exp = $a ** $_;
    $res = 1 if($exp == $N);
    last if ($exp >= $N);
  }
}

# Output
say $res;
