#!/usr/bin/env perl

use v5.36;
use Algorithm::Combinatorics qw(combinations);
my $divisor=2;
my @list=sort (4, 5, 1, 6);
my $iter=combinations(\@list, 2);
my $count=0;
while(my $z=$iter->next){
    my ($x, $y)=@$z;
    ++$count if ($x+$y)%$divisor==0;
}
say "The number of pairs from the list ",
    join(", ", @ARGV), " with sum divisible by $divisor is $count";
