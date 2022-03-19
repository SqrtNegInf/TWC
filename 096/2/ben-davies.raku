#!/usr/bin/env raku

use experimental :cached;
unit sub MAIN(Str:D $s1 = 'kitten', Str:D $s2 = 'sitting') {
    say levenshtein $s1.comb, $s2.comb;
}

proto sub levenshtein(@, @ --> Int:D) is cached {*}
multi sub levenshtein([], @c2 --> Int:D)        { +@c2 }
multi sub levenshtein(@c1, [] --> Int:D)        { +@c1 }
multi sub levenshtein(
    @c1 [Str:D $h1, **@t1],
    @c2 [Str:D $h2, **@t2],
    --> Int:D
) {
    $h1 eq $h2
        ?? levenshtein @t1, @t2
        !! 1 + min map &levenshtein, @t1, @c2, @c1, @t2, @t1, @t2
}
