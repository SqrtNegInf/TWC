#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;

sub count_zero{
    my($x, $y) = @_;
    my $count = 0;
    {
        my $x_original = $x;
        $x = $x - $y if $x >= $y;
        $y = $y - $x_original if $y >= $x_original;
        $count++;
        redo unless $x == 0 && $y == 0;
    }
    return $count;
}

MAIN:{
    say count_zero(5, 4);
    say count_zero(4, 6);
    say count_zero(2, 5);
    say count_zero(3, 1);
    say count_zero(7, 4);
}
