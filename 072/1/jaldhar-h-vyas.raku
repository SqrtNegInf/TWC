#!/usr/bin/env raku

sub MAIN(
    Int $N where { $N ~~ any 1 .. 10} = 10
) {
    (([*] 1 .. $N) ~~ / <(0+)> $ / // q{}).chars.say;
}
