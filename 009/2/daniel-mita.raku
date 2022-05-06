#!/usr/bin/env raku

my %*SUB-MAIN-OPTS = :named-anywhere;

multi MAIN (
  Bool :standard(:$s), #= Use Standard Ranking (1224). Default if no ranking is provided.
  Bool :dense(:$d),    #= Use Dense Ranking (1223).
  Bool :modified(:$m)  #= Use Modified Ranking (1334).
  where { any(.one, .none) given @($s, $m, $d) },
) {
  my @scores = <foo 3 bar 8 baz 1 fizz 3 buzz 6>;
  my %table;
  %table{.[1]}.push(.[0]) for @scores.rotor(2);

  say join "\n", gather {
    for %table.keys.sort(&infix:«<=>»).reverse -> $score {
      state $rank = $m ?? 0 !! 1;                      # Start at 0 if modified, else 1
      $rank += %table{$score}.elems if $m;             # Add number of players at rank (modified)
      "$rank: $_".take for %table{$score}.values.sort; # Set all players at current rank
      $rank += %table{$score}.elems if none($m, $d);   # Next rank = players at current rank (standard)
      $rank++ if $d;                                   # Next rank is +1 (dense)
    }
  };
}
