#!/usr/bin/env raku

my $e-seq := gather
{
  take 1;

  my $current = 1;

  for 1 .. Inf
  {
    $current /= $_;
    take $current;
  }
}

sub MAIN (:$steps = 100)
{
  say $e-seq[^$steps].sum;
}

