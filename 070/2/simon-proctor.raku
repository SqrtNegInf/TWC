#!/usr/bin/env raku

#| Generate ther Gray Code of length N
sub MAIN (
    Int $N where 2 <= * <= 5 = 4
){
    say gray-bins( $N ).map( *.parse-base(2) );
}

multi sub gray-bins ( 1 ) { [ "0", "1" ] }

multi sub gray-bins ( Int $n ) {
    my @prev = gray-bins( $n - 1 );

    [ |@prev.map({ "0{$_}" }), |@prev.reverse.map({"1{$_}"}) ];
}
