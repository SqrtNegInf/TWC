#!/usr/bin/env raku

unit sub MAIN (UInt $n where $n > 0 = 500);

say (1 .. $n).grep({ .is-prime }).elems;
