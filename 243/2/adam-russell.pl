#!/usr/bin/env perl
use v5.36;

use POSIX;
sub floor_sum{
    my @integers = @_;
    my $floor_sum;
    do{
        my $i = $_;
        do{
            my $j = $_;
            $floor_sum += floor($integers[$i] / $integers[$j]);
        } for 0 .. @integers - 1;
    } for 0 .. @integers - 1;
    return $floor_sum;
}

MAIN:{
    say floor_sum 2, 5, 9;
    say floor_sum 7, 7, 7, 7, 7, 7, 7;
}
