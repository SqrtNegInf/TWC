#!/usr/bin/env raku

use Prime::Factor;

sub MAIN( Int $limit where { $limit > 0 } = 16 ) {
     my @totients = lazy (0 .. *).map: { $_ *  [*] $_.&prime-factors.squish.map: 1 - 1/*  };
     my @perfect-totients = (3, * + 2 ... *).grep: -> $current {
         $current ==  [+] @totients[ $current ] , { @totients[ $_ ] }  ... 1
     };

     @perfect-totients[ 0 .. $limit ].join( ', ' ).say;
}
