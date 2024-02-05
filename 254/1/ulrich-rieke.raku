#!/usr/bin/env raku

my $number = 27;
my $third = FatRat.new( 1 , 3 ) ;
my $cuberoot = $number ** $third ;
say ( $cuberoot == floor( $cuberoot ) ) ;
