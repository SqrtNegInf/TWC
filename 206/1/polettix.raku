#!/usr/bin/env raku

sub MAIN (@args = ("10:10", "09:30", "09:00", "09:55")) { put shortest-time(@args) }

sub shortest-time (@times) {
   my \period = 24*60;
   @times
      .map({(.comb(/\d+/)».Int «*» (60, 1)).sum})  # turn everything into minutes
      .combinations(2)                             # create all possible pairs
      .map(->($x, $y) { ($x - $y) % period })      # calculate difference, modulo "period"
      .map({min($^x, period - $^x)})               # consider that and its reciprocal
      .min                                         # take the minimum, as requested
}
