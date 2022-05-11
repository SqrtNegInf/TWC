#!/usr/bin/env raku

my $row = '1 2 3 10';
my @numbers = $row.split( /\s/ ).map( {.Int} ) ;
say @numbers.combinations( 2 ).unique.map( { @_[0] +& @_[1] } ).sum ;
