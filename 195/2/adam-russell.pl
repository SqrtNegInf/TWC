#!/usr/bin/env perl
use v5.36;
##
# You are given a list of numbers, @list.
# Write a script to find most frequent even 
# numbers in the list. In case you get more 
# than one even numbers then return the smallest even integer. 
# For all other case, return -1.
## 
sub most_frequent_even{
    my @list = @_;
    @list = grep { $_ % 2 == 0 } @list; 
    return -1 if @list == 0;  
    my %frequencies;
    map { $frequencies{$_}++ } @list;
    my @sorted = sort { $frequencies{$b} <=> $frequencies{$a} } @list; 
    return $sorted[0] if $frequencies{$sorted[0]} != $frequencies{$sorted[1]};   
    my @tied = grep { $frequencies{$_} == $frequencies{$sorted[0]} } @list;
    return (sort { $a <=> $b } @tied)[0];       
}

MAIN:{
    my @list;
    @list = (1, 1, 2, 6, 2); 
    say most_frequent_even(@list);    
    @list = (1, 3, 5, 7); 
    say most_frequent_even(@list);    
    @list = (6, 4, 4, 6, 1); 
    say most_frequent_even(@list);    
}
