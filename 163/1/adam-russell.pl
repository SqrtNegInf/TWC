#!/usr/bin/env perl
use v5.36;

sub sum_bitwise{
    my $sum = 0;
    for my $i (0 .. @_ - 2){
        my $x = $_[$i];
	map {$sum += ($x & $_)} @_[$i + 1 .. @_ - 1];
    }
    return $sum; 
}

MAIN:{
    print sum_bitwise(1, 2, 3) . "\n";  
    print sum_bitwise(2, 3, 4) . "\n";
    print sum_bitwise(1, 2, 3, 10) . "\n";  
}  
