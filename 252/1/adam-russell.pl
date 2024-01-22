#!/usr/bin/env perl
use v5.36;

sub special_numbers{
    my $r;  
    do{
        $r += $_[$_] * $_[$_]  if @_ % ($_ + 1) == 0; 
    } for 0 .. @_ - 1;  
    return $r; 
}

say special_numbers 1, 2, 3, 4;
say special_numbers 2, 7, 1, 19, 18, 3;
