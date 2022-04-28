#!/usr/bin/env raku

sub MAIN(Str:D $input = 'bookkeeper') {
    my @matches = $input.comb( / (.) $0* / );
    say @matches.join("\n");
}


