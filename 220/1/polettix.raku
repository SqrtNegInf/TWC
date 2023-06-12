#!/usr/bin/env raku

sub MAIN (@words = ("love", "live", "leave")) { say common-characters(@words) }

sub common-characters (@words) {
   return [] unless @words;
   @words
      .map({ .lc.comb })
      .reduce(-> $a, $b { my $s = $b.Set; $a.grep({ $_ ∈ $s }) })
      .sort;
}
