#!/usr/bin/env raku

my %*SUB-MAIN-OPTS=:named-anywhere,;

sub MAIN(
    @LETTERS = <c r a t e>,
    ) {
    for 'words'.IO.lines.grep({ spl($_.lc,@LETTERS) }) {.say}
}

sub spl($word,@ltrs) { return ($word.comb.Bag (-) @ltrs).elems == 0 }
