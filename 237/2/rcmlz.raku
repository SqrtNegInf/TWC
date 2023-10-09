#!/usr/bin/env raku

our sub solution(@input) is export {
    my @sorted = @input.sort;
    [+] (@sorted.reverse Z- @sorted).grep(* > 0)
}

say solution  ( (1,3,5,2,1,3,1,5,5,5,4) ) ;
