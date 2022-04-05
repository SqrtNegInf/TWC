#!/usr/bin/env perl

use feature 'say';

my $one = 0;

my $N = 64;

die '$N is not an integer' unless int($N) == $N;
die '$N must be an integer larger than 1' unless $N > 1;

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
