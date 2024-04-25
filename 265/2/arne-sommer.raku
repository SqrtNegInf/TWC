#!/usr/bin/env raku

unit sub MAIN ($str = 'JB 007', @str = ['jj', 'bb', 'bjb']);

my $str-b = $str.comb.grep( * ~~ /<[a..z A..Z]>/)>>.lc.Bag;

#say ": Str Bag: { $str-b.raku }" if $verbose;

for @str.sort: *.chars -> $candidate
{
  my $candidate-bag = $candidate.comb>>.lc.Bag;
#  say ": Checking $candidate (Bag: { $candidate-bag.raku })" if $verbose;

  if $str-b (<=) $candidate-bag
  {
    say $candidate;
    exit;
  }
}
