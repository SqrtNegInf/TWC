#!/usr/bin/env raku



sub MAIN ( Int $max = 5, Int $elems = 3 ) {

    .say for (1..$max).combinations: $elems;
}
