#!/usr/bin/env raku

srand 1;

sub sixoffortynine {
  my @candidates = (1..49);
  @candidates = @candidates.pick(6);
  @candidates = sort {$^a <=> $^b}, @candidates;
  say join(', ', @candidates);
}

sixoffortynine();
