#!/usr/bin/env raku

sub postfix:<!> (Int $n) {   # factorial operator
    [*] 2..$n;
}
sub eul (Int $n) {
    [+] map { 1 / $_! }, 0..$n;
}
sub MAIN (Int $n = 100) {
    say eul $n;
}
