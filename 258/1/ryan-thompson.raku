#!/usr/bin/env raku

sub even_re { +@_.grep(/^(\d\d)+$/) }

say even_re(10, 1, 111, 24, 1000)
