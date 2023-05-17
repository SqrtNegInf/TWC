#!/usr/bin/env perl
use v5.36;

my $m = shift // '3/5';
my $p = getCFTparent($m);
my $g = getCFTparent($p);

printf "member = '%s' has parent = '%s' and grandparent = '%s'\n", $m, $p, $g;

sub getCFTparent($) {
  my ($n) = @_;

  ($a, $b) = split(/\//, $n);

  if ($a < $b) {
    return sprintf('%d/%d', $a, $b - $a);
  } elsif ($a > $b) {
    return sprintf('%d/%d', $a - $b, $b);
  }
} 
