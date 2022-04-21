#!/usr/bin/env raku

my @files = '../00-blogs';
    .say for @files
        .map({ |.IO.lines.lc.comb( /\w/ ) })
        .Bag
        .sort
        .map({  "{.key}: {.value}" })
    ;
