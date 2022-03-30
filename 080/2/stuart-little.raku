#!/usr/bin/env raku

sub candy(@a) {
    (@a Z- @a[1..*]).grep(* != 0).elems + @a;
}

say candy((1,4,3,2));
