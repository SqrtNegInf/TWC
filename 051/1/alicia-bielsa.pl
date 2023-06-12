#!/usr/bin/env perl
use v5.36;

my $target = 0;
my  @L = sort(-25,  -7, -3, 2, 4, -10,8, 10);

foreach my $a (0..$#L){
    foreach my $b ($a+1..$#L){
        foreach my $c ($b+1..$#L){            
            if ( ($L[$a] + $L[$b] + $L[$c]) == $target){
                print $L[$a]."  + ".$L[$b]." + ".$L[$c]." = $target.\n";
            }
        }
    }
}

