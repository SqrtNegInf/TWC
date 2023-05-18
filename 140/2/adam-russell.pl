#!/usr/bin/env perl
use v5.36;

sub nth_from_table{
    my($i, $j, $k) = @_;
    my @table;
    for my $x (1 .. $i){
        for my $y (1 .. $j){
            push @table, $x * $y; 
        }  
    }  
    return (sort {$a <=> $b} @table)[$k - 1];   
} 

MAIN:{
    print nth_from_table(2, 3, 4) . "\n";  
    print nth_from_table(3, 3, 6) . "\n";  
} 
