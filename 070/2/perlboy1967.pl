#!/usr/bin/env perl
use v5.36;

my ($N) = 4;

my @g = genGrayCodeSequence($N);

printf q{
Input: $N = %d
Output: [%s]
}, $N, join(', ', @g);

sub genGrayCodeSequence {
  my ($N) = @_;

  my @g = (0, 1);

  for my $i (2 .. $N) {
    map { $_ = "0$_" } @g;
    map { m/^.(.*)/; push(@g, "1$1") } reverse @g;
  }

  map { $_ = oct("0b$_") } @g;
}

