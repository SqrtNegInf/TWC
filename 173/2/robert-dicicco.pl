#!/usr/bin/env perl
use v5.36;
use bigint;
use List::Util qw/product/;

my @arr = (2);
my $count = 1;
my $prod = 1;

print("$arr[0]\n");

while (1) {

  $prod = product(@arr) + 1;

  print("$prod\n");

  push(@arr,$prod);

  $count++;

  last if ($count == 10);

}
