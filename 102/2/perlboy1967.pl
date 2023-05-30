#!/usr/bin/env perl
use v5.36;

foreach my $n (2,20,120) {
  printf "hashCountingString(%d) = '%s'\n",
         $n, hashCountingString($n);
}


sub hashCountingString {
  my ($n) = @_;

  my $r = '';

  while ($n > 0) {
    $r = ($n > 1 ? $n.'#'.$r : '#'.$r);
    $n -= length($n) + 1;
  }

  return $r;
}
