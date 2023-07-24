#!/usr/bin/env raku

say (1, 5, 0, 3, 5).grep( * > 0).unique.elems;
