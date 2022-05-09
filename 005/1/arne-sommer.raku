#!/usr/bin/env raku

unit sub MAIN (Str $word is copy where $word !~~ /\W/ = 'animal',
  :$dictionary where $dictionary.IO.r = "words");

$word .= lc;

my $dict = get-dictionary($dictionary);
 
print "Anagrams:";

for $word.comb.permutations>>.join.unique -> $candidate
{
  # next if $candidate eq $word;
  print " $candidate" if $dict{$candidate};
}
print "\n";

sub get-dictionary ($file where $file.IO.r) is export
{
  return $file.IO.lines.grep(* !~~ /\W/)>>.lc.Set;
}

