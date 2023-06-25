#!/usr/bin/env perl
use v5.36;

my @A =(10,8,5,4,3);

my $h=0;
for(sort{$b<=>$a}@A){
    last if $_<=$h;
    ++$h
}
say join " ", @A, "->", $h;
