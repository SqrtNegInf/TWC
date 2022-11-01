#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say signatures);
no warnings qw(experimental);

sub totalZero($x, $y)
{
    my $steps = 0;

    while(not (($x == 0) && ($y == 0)))
    {
        my $tempX = $x;
        my $tempY = $y;
        
        if($x >= $y)
        {
            $tempX -= $y;
        }
        
        if($y >= $x)
        {
            $tempY -= $x;
        }
        
        $x = $tempX;
        $y = $tempY;
        $steps++;
        
    }
    say($steps);

}


# Examples:
totalZero(5,4); # 5
totalZero(4,6); # 3
totalZero(2,5); # 4
totalZero(3,1); # 3
totalZero(7,4); # 5
