#!/usr/bin/env raku

#unit sub MAIN(*@ints);

put so +<1 2 3 4 5>.grep(* %% 2) > 1;
