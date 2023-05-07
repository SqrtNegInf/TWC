#!/usr/bin/env perl
use v5.36;

use ntheory qw/is_prime/;
use List::MoreUtils qw(uniq);

my @perrin = qw(3 0 2 );      # working array

my @results = ();

my $i = 0;

my $PRIME_COUNT = 13;

while($i <= $PRIME_COUNT) {

  my $slots = scalar(@perrin);

  my $calc_val = $perrin[$slots - 2] + $perrin[$slots - 3];

  push(@perrin, $calc_val);

  if (is_prime($calc_val)) {

    push(@results, $calc_val);

    $i++;

  }

}

@results = sort { $a <=> $b } uniq(@results);

foreach(@results) {

  print("$_ ");

}

print("\n");
