#!/usr/bin/env raku

my %result = '../00-blogs'.IO.comb>>.lc.grep(* ~~ /<:L>/).Bag;

for %result.keys.sort -> $key
{
  say "$key: %result{$key}";
}

