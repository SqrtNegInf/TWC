#!/usr/bin/env raku
use v6;

my $input = @*ARGS[0] // "input.txt";

given $input.IO.open {
    for 0..2 -> $num {
        say "Taking 3 characters: ", .readchars: 3;
    }
}
