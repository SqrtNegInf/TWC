#!/usr/bin/env perl
use v5.36;

my $SIZE = 500;

my @hotel = (0) x $SIZE;

for my $emp (1..$SIZE) {
    my @doors = map { $_ % $emp == 0 ? 1 : 0 } ( 1..$SIZE );
    for my $idx ( 0..$SIZE-1 ) {
        $hotel[$idx] = $hotel[$idx] ^ $doors[$idx];
    }
}

for (0..$SIZE-1) {
   printf "room %3s is open\n", $_+1 if $hotel[$_];
}
