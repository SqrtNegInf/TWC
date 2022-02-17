#!/usr/bin/env raku

#sub MAIN(*@nums where .all ~~ Int) {
    my @nums = (^1000).pick(*);
    put + [<] @nums;
#}
