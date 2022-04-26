#!/usr/bin/env raku

sub MAIN(@files = <sample.txt sample1.txt sample2.txt>) {
    my %inv_index;

    for @files -> $file {
        for $file.IO.words.unique -> $word {
            if %inv_index{$word}:exists {
                %inv_index{$word} = ($file, |(%inv_index{$word}));
            } else {
                %inv_index{$word} = ($file);
            }
        }
    }

    for %inv_index.keys.sort -> $k {
        say "$k: " ~ %inv_index{$k};
    }
}


