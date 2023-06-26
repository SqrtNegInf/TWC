#!/usr/bin/env perl
use v5.36;

mm(1, 2, 3, 4, 5);      # Output: 5
mm(5, 1, 2, 3, 4);      # Output: 0
mm(1, 1, 4, 2, 1, 3);   # Output: 3


sub mm(@array)
{
    my @sortedArray = sort @array;
    my $count       = 0;
    
    for(my $i = 0; $i < @array; $i++)
    {
        $count++    if($sortedArray[$i] == $array[$i]);
    }
    
    say $count;
}
