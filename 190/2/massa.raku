#!/usr/bin/env raku

use Test;

is-deeply <AA K>,                decoded-list 11;
is-deeply <AAAE AAO AKE KAE KO>, decoded-list 1115;
is-deeply <ABG LG>,              decoded-list 127;

done-testing;

sub decoded-list(Str() $_) {
  combinations(.chars + 1, .chars div 2 .. .chars + 1)».\ # all the combinations
    rotor(2=>-1)».Array».map({.[0] ..^ .[1]})».Array.\    # transformed in contiguous subsets
      grep(*».elems.all == 1|2).\                         # subsets must be of size one or two
        grep(*».elems.sum == .chars)».\                   # and they must cover the whole string
          map(-> @s { .comb[@s].join })».\                # map to the original string's chars
            trans([1..26] => ['A'..'Z'])».join.\          # decode
              sort.unique
}

