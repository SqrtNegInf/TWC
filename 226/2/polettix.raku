#!/usr/bin/env raku

sub MAIN (@ints = (1, 5, 0, 3, 5)) { put @ints.unique.grep({$_}).elems }
