#!/usr/bin/env raku

sub uprefix($w,@a) {
    ([\~] $w.comb).first(-> $p { @a.grep({ $_.starts-with($p) }).elems == 1 })
}

my @ARGS = <alphabet book carpet cadmium cadeau alpine>;
say @ARGS.map({ uprefix($_,@ARGS) })
