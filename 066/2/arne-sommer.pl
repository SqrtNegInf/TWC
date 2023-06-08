#!/usr/bin/env perl
use v5.36;

my $one = 0;

my $N = 64;

my $match = 0;

for my $base (2 .. sqrt($N))
{
  my $exp = 1;
  while ($exp++)
  {
    my $candidate = $base ** $exp;
    last if $candidate > $N;

     if ($candidate == $N)
     {
       say "$base^$exp";
       $match++;
       exit if $one;
     }
  }
}

say 0 unless $match;
