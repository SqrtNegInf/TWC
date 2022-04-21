#!/usr/bin/env raku

# We define letters as graphemes in any language supported by Raku that
# match the <alpha> class.  We display how many times each grapheme
# appears in the files.

my @filenames = '../00-blogs';
    my %letters;
    for @filenames -> $fn {
        my @chars = $fn.IO.lines.comb: /<alpha>/;
        for @chars -> $char {
            %letters{$char.fc}++;
        }
    }

    for %letters.keys.sort -> $key {
        say "$key: {%letters{$key}}";
    }
