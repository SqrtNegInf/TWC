#!/usr/bin/env perl
use v5.36;

use experimental 'declared_refs';

leftRightSumDiff(10, 4, 8, 3);      # (15, 1, 11, 22)
leftRightSumDiff(1);                # (0)
leftRightSumDiff(1, 2, 3, 4, 5);    # (14, 11, 6, 1, 10)

sub createSumArr(@arr)      # creates the (0, a, (a+b), (a+b+c)) stuff
{
    my @resultArr = (0);
    
    for(my $i = 0; $i < $#arr ; $i++)
    {
        my $sum;
        
        for(0..$i)
        {
            $sum += $arr[$_];
        }
        push @resultArr, $sum;
    }
    
    return \@resultArr;
}

sub leftRightSumDiff(@list)     # creates the @left_right_sum_diff stuff
{
    my (\@left, \@right)  = (createSumArr(@list), createSumArr(reverse @list));
    
    @right = reverse @right;

    my @finalResult;
    for( my $i = 0; $i < @right; $i++)
    {
        $finalResult[$i] = abs( $left[$i] - $right[$i]);
    }
    
    say join',', @finalResult ;
}
