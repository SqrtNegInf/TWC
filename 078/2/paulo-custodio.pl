#!/usr/bin/env perl
use v5.36;

my @A = (10,20,30,40,50); my @B = (3,4);

for my $i (@B) {
    my @a = (@A[$i .. $#A], @A[0 .. $i-1]);
    say "[@a]";
}
