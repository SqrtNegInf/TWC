#!/usr/bin/env raku

sub process($filename, %index) {
    my $lineno = 0;

    for $filename.IO.lines -> $line {
        $lineno++;
        for $line.words -> $word {
            %index{$word}.push({ document => $filename, line => $lineno });
        }
    }
}

sub MAIN() {
    my %index;

    for <sample.txt sample1.txt sample2.txt> -> $filename {
        process($filename, %index);
    }

    for %index.keys.sort -> $word {
        $word.say;
        for %index{$word}.sort({ %^a{'document'} cmp %^b{'document'} }) -> %entry {
            say q{ }, %entry{'document'}, ' - ', %entry{'line'}; 
        }
    }
}
