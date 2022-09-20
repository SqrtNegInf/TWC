#!/usr/bin/env perl
use v5.36; 

sub index_biggest{
    my(@numbers) = @_;
    my @sorted = sort {$b <=> $a} @numbers; 
    map { return $_ if $numbers[$_] == $sorted[0] } 0 .. @numbers - 1; 
}

MAIN:{
    my @n;
    @n = (5, 2, 9, 1, 7, 6, 9);
    print index_biggest(@n) . "\n";  
    @n = (4, 2, 3, 1, 5, 0);  
    print index_biggest(@n) . "\n";  
}
