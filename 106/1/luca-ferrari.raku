#!/usr/bin/env raku

(1, 3, 8, 2, 0).sort.rotor( 2 => -1 ).map( { $_[ 1 ] - $_[ 0 ] } ).max.say;
