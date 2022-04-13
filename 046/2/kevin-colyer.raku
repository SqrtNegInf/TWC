#!/usr/bin/env raku

use Test;

# initialise doors to open (= 1) after 1st employee opens all doors
my Int @doors = 1 xx 500;
# loop through employees
for 2..500 -> $e {
    my $i=0;
    # iterate through doors
    while $i < 500 {
        @doors[$i] = 1 - @doors[$i];
        $i+=$e;
    }
}
# reduce array by sum of open doors
say @doors.sum;

