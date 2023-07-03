#!/usr/bin/env perl
use v5.36;

use List::UtilsBy qw(min_by);

my @extended = (1, 3, 1, 5, 8 ,1);
my $total;
my $amount;
$total += $amount while(defined ($amount=next_amount())); # pick coins while they last
say "@ARGV -> $total";

sub next_amount(){ # choose a box and compute coins
    return if @extended==0+2; # no more boxes, the 2 comes from the boundary guards
    return splice @extended,1,1 if @extended==3; # only one box
    my $i=min_by {$extended[$_]} # choose smallest box
        @extended==2+2
	?(1,2)                   # only two remaining boxes, consider boundaries
	:(2..@extended-3);       # more boxes, disregard boundaries
    my $value=splice @extended,$i,1; # remove box from array
    return $value*$extended[$i-1]*$extended[$i]; # compute value from neighbor boxes
}
