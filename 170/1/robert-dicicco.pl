#!/usr/bin/env perl
use v5.36;
use ntheory qw/is_prime/;

my $count = 1;

my $product = 1;

say 1;

foreach(1..100){

  my $x = $_;

  if(is_prime($x)){

    $product *= $x;

    say $product;

    $count++;

    last if ($count == 10);

  }

}
