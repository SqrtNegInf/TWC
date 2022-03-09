#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
use feature 'state';

no warnings qw(experimental::signatures);

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
