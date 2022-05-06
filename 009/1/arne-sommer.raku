#!/usr/bin/env raku

for 100 .. Inf
{
  my $candidate = $_ ** 2;
 
  ( say "$_ -> $candidate"; last ) if $candidate.comb.Bag.elems >= 5;
}
