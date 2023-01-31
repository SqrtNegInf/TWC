#!/usr/bin/env raku

sub missing-numbers( @a -->Array) {
    @ = [0..@a.elems].grep: * != (grep ( -1 < * ≤  @a.elems),@a).any;
}

my @array = (0, 1, 3, 5, 9, 10);
say @array.sort;
say "Input: \@array = @array[]\nOutput: ", missing-numbers( @array);

