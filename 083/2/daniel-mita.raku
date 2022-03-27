#!/usr/bin/env raku

sub MAIN(
  @positive-nums = (2,13,10,8)
  --> Nil
) {
  @(
    @positive-nums.combinations(1..*)
      .grep( *.sum ≤ @positive-nums.sum / 2 )
      .sort({ $^b.sum <=> $^a.sum || $a.elems <=> $b.elems })
  )[0].elems.say;
}
