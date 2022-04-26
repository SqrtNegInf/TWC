#!/usr/bin/env raku

sub rev_idx(@files) {
    my @words=@files.map({ $_.IO.comb(/\w+/) }).map(|*).Set.keys.map(*.lc).unique.sort;
    @words.map({ $_ => @files.grep( -> $file { $file.IO.slurp.contains($_) }) })
}

for rev_idx(<sample.txt sample1.txt sample2.txt>) {.say}
