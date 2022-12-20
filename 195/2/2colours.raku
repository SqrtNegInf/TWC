#!/usr/bin/env raku

my @list = (1,1,2,2,6,6);
@list.grep(* %% 2).Bag andthen
    .so ?? .max({ .value, - .key }).key !! -1 andthen
    .say;
