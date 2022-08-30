#!/usr/bin/env raku

use Lingua::EN::Numbers :short;

my @arr = 11,62,99;

for @arr  {
  print "$_ => ", ord-n($_), "\n";
}
