#!/usr/bin/env raku

use Prime::Factor;

our sub solution(@input) is export {
    @input ==> map( -> $n { $n => prime-factors($n).elems } ) 
           ==> sort(      { my Order $o = $^a.value cmp $^b.value; 
                            $o == Same ?? $^a.key cmp $^b.key !! $o } )
           ==> map( *.key )
}

say solution ( (11,8,27,4) );
