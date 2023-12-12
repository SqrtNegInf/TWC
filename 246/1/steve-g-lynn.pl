#!/usr/bin/env perl
#use v5.36; # incompatible with sub name set directly via symbol table 

srand 1;

local *six_out_of_49 = sub {
    local @six_out_of_49 = map {rand} 0 .. 48;
    return (sort {$six_out_of_49[$a-1] <=> $six_out_of_49[$b-1]} 1 .. 49) [0 .. 5];
};

local @six_out_of_49=&six_out_of_49;
print "@six_out_of_49";
