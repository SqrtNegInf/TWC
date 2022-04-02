#!/usr/bin/env raku

unit sub MAIN(@array where .all ~~ Int:D =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8), Int:D :$s where 1 <= * <= @array = 3) {
    say (0...@array - $s).map({ @array.skip($_).head($s).min });
}
