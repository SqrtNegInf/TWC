#!/usr/bin/env raku

my @ints = 10, 1, 111, 24, 1000; # 3
# my @ints = 111, 1, 11111; # 0
# my @ints = 2, 8, 1024, 256; # 1

say (
        @ints.grep(
            *.chars %% 2
        )
        .elems
    );
