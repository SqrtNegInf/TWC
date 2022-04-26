#!/usr/bin/env raku

my @files = <sample.txt sample1.txt sample2.txt>;
my %dict;
for @files -> $file {
    for $file.IO.lines.words.grep({/^ \w ** 3..* $/}) -> $word {
        %dict{$word}{$file} = True;
    }
}
.say for %dict{'zizzer'}.keys.sort;
