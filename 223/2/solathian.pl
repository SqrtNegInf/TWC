#!/usr/bin/env perl
use v5.36;
use experimental 'declared_refs';

use List::Util qw(max);
use Algorithm::Combinatorics qw(permutations);

boxCoins(1, 5);             # 10
boxCoins(3, 1, 5, 8);       # according to the example 167 but there is better solution 189

sub boxCoins(@inputArray)
{
    
    my @theSums;       # https://www.youtube.com/watch?v=qO-mSLxih-c

    foreach my $arrayRef (permutations \@inputArray)    # go with the brute force approach I guess
    {
        my $sum;
        my \@boxArray = $arrayRef;
    
        while(@boxArray > 0)
        {
            # always pick an element in the middle
            my $targetIndex = int(@boxArray/2);

            my $prev    =  (0 <= ($targetIndex-1) < @boxArray )   ? $boxArray[$targetIndex-1] : 1;
            my $current =                                           $boxArray[$targetIndex];
            my $next    =  (0 <= ($targetIndex+1) < @boxArray )   ? $boxArray[$targetIndex+1] : 1;
            
            $sum += $prev * $current * $next;
            
            # remove the element in the middle
            splice @boxArray, $targetIndex, 1;       
        }
        push(@theSums, $sum);
    }
    say max(@theSums);
}
