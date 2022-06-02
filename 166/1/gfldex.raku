#!/usr/bin/env perl6
# from https://gfldex.wordpress.com/2022/05/25/reducing-sets/

    sub less-substitutions-then ($_, $n) {
        .subst(/<-[olist]>/, :g, '').chars < $n
    }

    #'/usr/share/dict/words'.IO.words.race\
    'words.txt'.IO.words #.race\
        .grep({.chars ≤ 8 && .&less-substitutions-then(4)})
        .map(*.trans(<o l i s t> => <0 1 1 5 7>))
        .grep(/^ <[0..9 a..f A..F]>+ $/)
        .sort(-*.chars)
        .join("\n")
        .say
