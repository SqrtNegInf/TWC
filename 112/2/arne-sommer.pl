#!/usr/bin/env perl
use v5.36;

my $n = $ARGV[0] // 10;

my $matches = 0;

climb(0);

sub climb ($sum)
{
  return if $sum > $n;
  if ($sum == $n)
  {
    $matches++;
    return;
  }

  climb($sum +1);
  climb($sum +2);
}

say $matches;
