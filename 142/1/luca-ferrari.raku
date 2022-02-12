#!/usr/bin/env raku

#sub MAIN( Int $m where { $m > 1 }
#          , Int $n where { $n > 0 && $m > $n } ) {
    my ($m,$n) = 24, 2;
   ( 1 .. $m ).grep( $m %% * ).grep( * ~~ / ^ \d* $n $ / ).elems.say;
#}
