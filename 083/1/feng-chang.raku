#!/usr/bin/env raku

sub MAIN(Str:D $s = 'Markmið lífs okkar er að vera hamingjusöm') {
    say $s.words.head(*-1).tail(*-1).join.chars;
}
