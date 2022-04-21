#!/usr/bin/env raku

sub MAIN(@files = ['example.txt'], Bool :$csv) {
    my %word_count;
    for @files -> $file {
        for $file.IO.words -> $word {
            %word_count{$word}++;
        }
    }

    my $infix = gather { if $csv { take "," } else { take ":\t" } };
    for %word_count.sort(-*.value)>>.kv -> ($word, $count) {
        say "$word$infix$count";
    }
}
