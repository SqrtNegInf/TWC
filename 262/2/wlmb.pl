#!/usr/bin/env perl
use v5.36;

my ($k,@ints)=(2,3,1,2,2,2,1,3);
my $count=0;
for my $i(0..@ints-2){
    for ($i+1..@ints-1){
	++$count if $ints[$i]==$ints[$_] && ($i*$_)%$k==0;
    }
}
say "k=$k, ints=@ints -> $count";
