#!/usr/bin/env raku

my @files = '../00-blogs';
    my $histo = (map {.IO.comb».lc}, @files).Bag;
    say "$_ : ", $histo{$_} for 'a'..'z';
