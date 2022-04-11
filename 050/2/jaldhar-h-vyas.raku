#!/usr/bin/env raku

multi sub MAIN(@ARGS=(19,11,9,7,20,3,17,16,2,14,1) ) {
    my @L = @ARGS.sort;
    my $size = @L.elems;

    loop (my $n = 0; $n < $size; $n++) {
        if (@L[$n] == $size - $n - 1) {
            say @L[$n];
        }
    }
}
