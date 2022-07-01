#!/usr/bin/env raku

my $count = 1;

my $product = 1;

say 1;

for (1..100) -> $x {

  if (is-prime($x)) {

    $product *= $x;

    say $product;

    $count++;

    last if $count == 10;

  }

}
