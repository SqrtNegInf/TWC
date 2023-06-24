#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

my @line = ();

sub next_line {
  $line[$_-1] += $line[$_] for 1..@line;
  unshift @line,1;
  return \@line;
}

say "@{next_line()}" for 1..10;
