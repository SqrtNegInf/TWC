#!/usr/bin/env raku

use Test;

srand 1;

sub missing-numbers( @a -->Array) {
    @ = [0..@a.elems].grep: * != (grep ( -1 < * ≤  @a.elems),@a).any;
}

plan +@Test;

for @Test -> (:key(@in), :value(@exp)) {
        is missing-numbers( @in), @exp, "@in[]";
}
done-testing;

my @array = pick 5, -3..8;
say @array.sort;
say "Input: \@array = @array[]\nOutput: ", missing-numbers( @array);

