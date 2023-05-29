#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(variations);
use List::Util qw(product);

maxProd(3, 1, 2);                 # 1 x 2 x 3   =>   6
maxProd(4, 1, 3, 2);              # 2 x 3 x 4   =>  24
maxProd(-1, 0, 1, 3, 1);          #  1 x 1 x 3  =>   3
maxProd(-8, 2, -9, 0, -4, 3);     # -9 × -8 × 3 => 216

sub maxProd(@data)
{
    my @arrays = variations(\@data, 3);
    
    my $max;
    my $maxArray;
    
    foreach my $arrayRef (@arrays)
    {
        my $prod = product(@$arrayRef);
        
        if((not defined $max) || ($prod > $max))
        {
            $max        = $prod;
            $maxArray   = $arrayRef;
        }
        
    }
    
    say( join(" x ", @$maxArray), " => $max");
}
