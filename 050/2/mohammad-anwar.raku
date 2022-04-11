#!/usr/bin/env raku

sub MAIN(Int $count = 3) {
    #my @L = (1..50).pick($count);
    my @L = (19,11,9,7,20,3,17,16,2,14,1);
    find-noble-number(@L);
}

sub find-noble-number(@L) {
    for @L -> $N {
        say "Found noble number [$N] in the list [" ~ @L.Str ~ "]."
            if ((grep { .Int > $N }, @L).elems == $N);
    }
}
