#!/usr/bin/env raku

my \letters = bag <c r a t e>.uc.comb: /\w/;

for 'words'.IO.lines() {
    .say if letters ⊇ .uc.comb;
}
