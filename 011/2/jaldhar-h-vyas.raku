#!/usr/bin/env raku

multi sub MAIN(
    Int $n where $n > 1 = 5
) { 

    for (0 .. $n - 1) -> $i {
        for (0 .. $n - 1) -> $j {
            print ($j == $i) ?? '1 ' !! '0 '; 
        }
        print "\n";
    }
}
