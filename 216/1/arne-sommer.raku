#!/usr/bin/env raku

unit sub MAIN (:r(:$reg) where $reg.chars >= 3;
               *@words where @words.elems > 0 && all(@words) ~~ /^<[a..z]>+$/,
               :v(:$verbose));

my @reg = $reg.comb.grep({ $_ eq any('A' .. 'Z') })>>.lc;

say ": Reg chars: { @reg.map({ "'" ~ $_ ~ "'" }).join(", ") } " if $verbose;

my @matches;

for @words -> $word
{
  my @word = $word.comb;

  print ": Word '$word' chars: { @word.map({ "'" ~ $_ ~ "'" }).join(", ") }" if $verbose;

  if @reg.Bag (<=) @word.Bag
  {
    say " -> subset" if $verbose;
    @matches.push: $word;
  }
  elsif $verbose
  {
    say "";
  }
}

say "(" ~ @matches.map({ "'" ~ $_ ~ "'" }) ~ ")";
