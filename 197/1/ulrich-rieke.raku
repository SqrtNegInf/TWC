#!/usr/bin/env raku

my @numbers =(1, 0, 3, 0, 0, 5);
my @nonzeroes = @numbers.grep( { $_ != 0 } ) ;
my @zeroes = @numbers.grep( { $_ == 0 } ) ;
my @ordered = @nonzeroes.push( |@zeroes ) ;
say '(' ~ @ordered.join( ',' ) ~ ')' ;
