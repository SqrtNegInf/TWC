#!/usr/bin/env perl
use v5.36;

my @in= (1, 0, 2, 3, 0, 4, 5, 0);
my @out;
while(@in){
    push @out, shift @in; # move from @in to @out
    pop @in,              # remove last element
    push @out, 0          # and duplicate zero
    if @in                # if there is enough space
    && $out[-1]==0;       # and the last element was a 0
}
say "@in -> @out";
