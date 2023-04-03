#!/usr/bin/env raku
use Test;

is kill-and-win(2,3,1),       6;                                
is kill-and-win(1,1,2,2,2,3), 11;                      
is kill-and-win(1,1,2,2,2,3,3), 14;                      

sub kill-and-win(*@ints)
{
    sum @ints
}
