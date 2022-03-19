#!/usr/bin/env raku

unit sub MAIN(Str:D $s = 'The Weekly Challenge') {
    say $s.trim.words.reverse.join: ' ';
}
