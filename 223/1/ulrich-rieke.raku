#!/usr/bin/env raku

say (2..500).grep( {.is-prime} ).elems ;
