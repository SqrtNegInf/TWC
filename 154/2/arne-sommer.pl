#!/usr/bin/env perl
use v5.36;

# all #s, not primes
my $count = $ARGV[0] || 20;

sub next_padovan
{
  state @padovan = (1, 1, 1);
  state $index   = 0;
  
  while (@padovan <= $index)
  {
    push(@padovan, $padovan[-2] + $padovan[-3]);
  }

  return $padovan[$index++];
}

my @ps; push(@ps, next_padovan($_)) for 1..$count;

say join(", ", @ps);
