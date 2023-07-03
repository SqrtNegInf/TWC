#!/usr/bin/env raku

(2..500).grep( *.is-prime ).elems.say;
