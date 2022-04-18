#!/usr/bin/env raku

constant %values = (
  1  => 'AGISUXZ'.comb,
  2  => 'EJLRVY'.comb,
  3  => <F D P W>,
  4  => <B N>,
  5  => 'TOHMC'.comb,
  10 => <K Q>,
).invert;

constant %tiles = (
  :8A, :5B, :4C, :3D,
  :9E, :3F, :3G, :5H,
  :5I, :3J, :5K, :3L,
  :5M, :4N, :5O, :5P,
  :4Q, :3R, :7S, :3T,
  :5U, :3V, :5W, :2X,
  :5Y, :5Z,
).Bag;


  my $amount = 7;
  constant %picked = (:1P, :1A, :1E, :1K, :1L, :1M, :1N).Bag;
    #"Tiles: %picked.kxxv.join()".say;
    "Winner: $_.key() for $_.value()".say with
      $?FILE.IO.parent.add('words').slurp.uc.words
      .grep({ .chars ≤ $amount && .comb ⊆ %picked })
      .map(sub {
        given $^a => $a.comb.map({ %values{$_} }).sum {
          sprintf("%-{$amount}s: %u", |.kv).say;
          .return;
        }
      }).sort({
        given $^b.value <=> $^a.value {
          when Same { $a.key.chars <=> $b.key.chars }
          default { $_ }
        }
      }).first;
