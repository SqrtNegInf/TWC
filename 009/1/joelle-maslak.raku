#!/usr/bin/env raku

my $seq = (0..∞).map( *² ).grep( { .comb.sort eq .comb.unique.sort } ).grep( *.chars ≥ 5 );
say $seq[0];

