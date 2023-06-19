#!/usr/bin/env perl
use v5.36;

use Math::BigFloat try => 'GMP';

my $a=0;
my $b=Math::BigFloat->new(1);
my $e=Math::BigFloat->new(1);

for (1..40) {
  $a++;
  $b/=$a;
  $e+=$b;
  print "$e\n";
}
