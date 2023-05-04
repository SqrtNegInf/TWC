#!/usr/bin/env perl
use v5.36;

my @inp = @ARGV ? @ARGV                       #input strings from command line
        : ('1 2', 'p q r', 's 3', '4 5 t');   #else use example data

my @out = map { //; [ grep @$_, map[ /$'/g ], @inp ] }
                                     '\d',    #one list of digit lists
                                     '[a-z]'; #and one for letter lists

use Data::Dumper; print Dumper( @out );       #view output data structure
