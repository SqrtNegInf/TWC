#!/usr/bin/env raku

srand 1;

multi MAIN (Int $n where * > 0 = 5) {
    my @array;

    my $n-items = ($n * 2) + 1; # we'll make sure we can't run out of numbers
    while @array.unique.elems < $n {
        # make an array of length $n - 1 containing unique random integers
        @array = (^($n - 1)).map({ (^$n-items).pick - ($n-items/2).Int }); # we'll make sure we can't run out of numbers
        # add up the array and negate the sum to get the last number
        push @array, -[+] @array;
    }
    
    # print the array
    say @array;
}
