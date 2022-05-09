#!/usr/bin/env raku

sub MAIN(Str $file where *.IO.r = 'words' ) {
    my %a is Bag = $file.IO.lines.map({.words.map({.comb}).flat.Bag});

    my $max_val = %a.values.max;
    for %a.pairs.grep: *.value == $max_val {
        say join(": ", .value, .key.kxxv.sort.join);
    }
}
