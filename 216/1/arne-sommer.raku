#!/usr/bin/env raku

my $reg = 'AB1 2CD';
my @words = ('abc', 'abcd', 'bcd');

my @reg = $reg.comb.grep({ $_ eq any('A' .. 'Z') })>>.lc;


my @matches;

for @words -> $word
{
  my @word = $word.comb;


  if @reg.Bag (<=) @word.Bag
  {
    @matches.push: $word;
  }
}

say "(" ~ @matches.map({ "'" ~ $_ ~ "'" }) ~ ")";
