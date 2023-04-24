#!/usr/bin/env raku

my token positive-integer { <[1..9]><[0..9]>* };
subset PosIntList of Str where /^ '(' <positive-integer>* % ',' ')' $/;

  <1 2 3 4 5 6>
    .sort: {$_ mod 2, $_}andthen
    .join: ',' andthen
    "($_)" andthen
    .say
