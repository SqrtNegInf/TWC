#!/usr/bin/env raku

say (1 ... 999).grep( *.is-prime).grep({ $_ eq .flip})
