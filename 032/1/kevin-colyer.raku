#!/usr/bin/env raku

use Test;

sub MAIN($file where *.IO.f = "example.txt", Bool :$csv = False) {
    my $bag=Bag.new($file.IO.slurp.lines>>.trim);
    my $delim=$csv ?? "," !! "\t";
    say $_.antipairs.fmt("%s$delim%s") for $bag.invert.sort.reverse;
}
