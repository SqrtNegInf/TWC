#!/usr/bin/env raku

(1 .. Inf).grep({ .is-prime })[10_000].say;
