#!/usr/bin/env perl
use v5.36;

gp(1,2,3,1,1,3);       # 4
gp(1,2,3);             # 0
gp(1,1,1,1);           # 6

sub gp(@array)
{
    my $count = 0;
    
    for(my $i = 0; $i < $#array; $i++)
    {
        for(my $j = $i+1; $j < @array; $j++)
        {
            $count++    if($array[$i] == $array[$j]);
        }
    }
    
    say    $count;
    return $count
}
