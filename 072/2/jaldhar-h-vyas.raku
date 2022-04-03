#!/usr/bin/env raku

sub MAIN(
    $A = 3,     #= start line
    $B = 6,     #= end line
    $file where { $A > 0 && $A <= $B} = 'input.txt'
) {
    .say for $file.IO.lines[$A - 1 .. $B - 1];
}
