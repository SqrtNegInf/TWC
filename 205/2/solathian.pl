#!/usr/bin/env perl
use v5.36;

maXor(1,2,3,4,5,6,7);       # 7
maXor(2,4,1,3);             # 7
maXor(10,5,7,12,8);         # 15

sub maXor(@array)
{
    my $max = 0;
    
    foreach my $value (@array)
    {
        map{ $max = $_ ^ $value     if(($_ ^ $value) > $max) }    @array;

    }
 
    say $max;
}
