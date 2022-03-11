#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use feature 'signatures';

no warnings "experimental::signatures";

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
