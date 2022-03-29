#!/usr/bin/env raku
unit sub MAIN($file='input.txt');

say freq-sort($file).join("\n\n");

sub freq-sort($file) {
    my $bag = bag ($file.IO.slurp andthen S:g/<[."(),]>|\'s|\-\-/ /.words);

    gather take "{.key} {.value.sort}" 
                               for $bag.classify({.value}, :as{.key}).sort;
}
