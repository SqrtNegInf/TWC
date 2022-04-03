#!/usr/bin/env raku
srand 1;;

sub MAIN (Int $n where {$n > 0} = 10 ) {

    # create our random array:
    # bookending the arr in 0s  
    # makes the comparisons at the ends cleaner
    
    my @a = 0, |(1..50).pick($n), 0 ;

    say "input array: @a[1..@a-2]";

    ## the indices for the original array elements
    ## map back to their array values iff comparison passes
    my @output = (1..^@a.end)
                .map: { @a[$_] if @a[$_-1] < @a[$_] && @a[$_] > @a[$_+1] };

    say "peak values: ", @output.join: ' '; 
    
}

