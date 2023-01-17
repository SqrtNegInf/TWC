#!/usr/bin/env perl

use v5.36;
use Algorithm::Combinatorics qw(combinations);

my ($x, $y, $z, @l)=(7,2,3,3,0,1,1,9,7);
my $good=grep {
    my ($p,$q,$r)=@$_;
    -$x<=$p-$q<=$x&&-$y<=$q-$r<=$y&&-$z<=$r-$p<=$z
} combinations(\@l,3);
say "$x $y $z: @l-> $good";
