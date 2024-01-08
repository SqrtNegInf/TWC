#!/usr/bin/env perl
use v5.36;

sub smallest_index{
    do{
        return $_ if $_ % 10 == $_[$_];  
    } for 0 .. @_ - 1;
    return -1;  
}

MAIN:{
    say smallest_index 0, 1, 2;   
    say smallest_index 4, 3, 2, 1;   
    say smallest_index 1, 2, 3, 4, 5, 6, 7, 8, 9, 0;   
}
