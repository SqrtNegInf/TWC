#!/usr/bin/env raku

# Methodology:
#   I've seen this one before. People tend to get too clever, so this is
#   a fairly simple solution.

for 1..20 -> $i { if $i %% 15 { say "fizzbuzz" } elsif $i %% 5 { say "buzz" } elsif $i %% 3 { say "fizz" } else { say $i } }
