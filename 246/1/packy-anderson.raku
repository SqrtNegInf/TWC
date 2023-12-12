#!/usr/bin/env raku

srand 1;

sub sixOutOfFourtyNine {
  return (1 .. 49).pick(6).sort;
}

sub solution {
  my @arr = sixOutOfFourtyNine();
  say @arr.join("\n");
}

say "Output:";
solution();
