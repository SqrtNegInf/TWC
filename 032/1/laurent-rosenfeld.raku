#!/usr/bin/env raku

sub MAIN (@files  = [<example.txt>]) {
    my $histo = @files.map({.IO.lines}).Bag;
    for reverse sort {$histo{$_}}, keys $histo -> $key {
        printf "%-20s%d\n", $key, $histo{$key};
    }
}
