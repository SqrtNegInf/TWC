#!/usr/bin/env raku

multi sub Ackermann( 0, UInt $n ) is pure { 
    $n+1;
}
multi sub Ackermann( UInt $m, 0 ) is pure { 
    Ackermann( $m-1, 1 ) 
}
multi sub Ackermann( UInt $m, UInt $n ) is pure { 
    Ackermann( $m-1, Ackermann($m, $n-1) ) 
}

#| Calculate the Ackermann number for m and n
sub MAIN( UInt $m = 1, UInt $n = 2 ) {
    say Ackermann( $m, $n );
}
