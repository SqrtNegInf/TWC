#!/usr/bin/env raku

our sub solution(@input) is export {
    [+] @input.combinations
              .grep( *.elems )
              .map( { .min * .max**2 } )
}

say solution ( (2, 0, 1, -10) );
