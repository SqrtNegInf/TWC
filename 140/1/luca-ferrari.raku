#!/usr/bin/env raku

sub MAIN( Str $a = '11',
          Str $b =  '1') {

    $_.base( 2 ).say given $a.parse-base( 2 ) + $b.parse-base( 2 );
}
