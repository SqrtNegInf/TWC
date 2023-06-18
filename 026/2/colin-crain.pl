#!/usr/bin/env perl
use v5.36;

use List::Util qw( reduce );

my $pi = 3.14159265358979;

## ## ## ## ## MAIN

## the angles are fed to the program in degrees, but Perl's trig functions want radians
my @angles = map { deg2rad($_) } (180,270,360);

## first  we convert to polar, r->(cos r, sin r)
## summing and dividing the coordinates to provide the average
## then use atan2(y,x) to get the result in radians

## this works well:
# my ($sumx, $sumy);
# for my $angle ( @angles ) {
#   $sumx += cos $angle;
#   $sumy += sin $angle;
# }
# my $v_avg = atan2( $sumy/(scalar @angles), $sumx/(scalar @angles) );

## but I like this more:
my $x = (reduce {$a + cos $b} 0, @angles) / scalar @angles;
my $y = (reduce {$a + sin $b} 0, @angles) / scalar @angles;
my $v_avg = atan2( $y, $x );

## convert back to degrees
say rad2deg( $v_avg );



## ## ## ## ## SUBS

sub deg2rad {
    return ($_[0]/180) * $pi;
}

sub rad2deg {
    return ($_[0]/$pi) * 180;
}


