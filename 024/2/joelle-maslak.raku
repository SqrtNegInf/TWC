#!/usr/bin/env raku

sub MAIN() {
    my %docs;

    # Read the files, seperating out the words.  Sadly no parallelism
    # here, I don't have a Perl6 module for doing simultanious file
    # reads of large files.  :(
    for <sample.txt sample1.txt sample2.txt> -> $fn {
        %docs{$fn} = $fn.IO.words.unique;
    }

    # Build the index
    my %index;
    for %docs.keys.sort -> $fn {
        for @(%docs{$fn}) -> $word {
            %index{$word} = [] unless %index{$word}:exists;
            %index{$word}.push: $fn;
        }
    }

    # Output the index
    for %index.keys.sort -> $word {
        say "$word: { %index{$word}.join(" ") }";
    }
}


