#!/usr/bin/env raku
my @abecedarian =  'dictionary.txt'.IO.lines.grep({[le] .comb});
say (reverse sort {.chars}, @abecedarian);
