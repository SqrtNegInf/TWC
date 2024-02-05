#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use POSIX ;

my $number = 27;
my $third = 1 / 3 ;
my $cuberoot = $number ** $third ;
if ( $cuberoot == floor( $cuberoot )) {
   say "true" ;
}
else {
   say "false" ;
}
