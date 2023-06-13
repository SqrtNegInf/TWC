#!/usr/bin/env perl
use v5.36;

my @scrambled = (
  [qw{ P + 2 l ! a t o }],
  [qw{ 1 e 8 0 R $ 4 u }],
  [qw{ 5 - r ] + a > / }],
  [qw{ P x w l b 3 k \ }],
  [qw{ 2 e 3 5 R 8 y u }],
  [qw{ < ! r ^ ( ) k 0 }],
);

my @freq;

for my $col (0..$#{$scrambled[0]}) {
  $freq[$col]{$scrambled[$_][$col]}++ for 0..$#scrambled;
}

say join '', map { (sort { $_->{$b} <=> $_->{$a} } keys $_->%*)[0] } @freq;
