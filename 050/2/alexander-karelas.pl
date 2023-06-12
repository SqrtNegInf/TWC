#!/usr/bin/env perl
use v5.36;

my @L = (19,11,9,7,20,3,17,16,2,14,1);

# solution
my @l = sort { $b <=> $a } @L;
my $noble;
for (my $i = 0; $i < @l and $l[$i] >= $i; $i++) {
    $noble = $i if $l[$i] == $i;
}

say defined $noble ? "Noble integer is: $noble" : "There is no noble integer in this set";
