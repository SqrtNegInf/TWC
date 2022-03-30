#!/usr/bin/env raku

#| Given a list of integers find the first positive integer not in the list.
#sub MAIN (
#    *@N where { $_.all ~~ Int } #= List of integers
#) {
    say (1...*).first( none(5, 2, -2, 0) );
    
#}
