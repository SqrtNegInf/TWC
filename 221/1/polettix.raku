#!/usr/bin/env raku

my @words = ("cat", "bt", "hat", "tree");  my $chars = "atach",
my $cbag = $chars.comb.Bag;
say @words.grep({ .comb.Bag ⊆ $cbag })».chars.sum;
