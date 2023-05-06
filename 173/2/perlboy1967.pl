#!/usr/bin/env perl

use v5.16;

use bigint;

use List::Util qw(reduce);


foreach (1 .. 10) {
  say sylvesterSequence($_);
}


sub sylvesterSequence {
  my ($i) = @_;

  state $s = [1];

  my $n = scalar(@$s);
  while (!defined $s->[$i]) {
    # Use 'reduce' as 'product'
    $s->[$n++] = (reduce { $a *= $b } (1,@$s)) + 1;
  }

  return $s->[$i];
}
