#!/usr/bin/env raku

our sub solution(@input) is export {
    my $n = @input.elems;
    my @output;
    for @input -> $entry {
        if $entry == 0 {
            for ^(min($n, 2)) {
                @output.push: 0;
                $n--; 
            }
        }else{
            @output.push: $entry;            
            $n--; 
        }
        last if $n < 1;
    }
    return @output.List
}

say solution ( (1, 0, 2, 3, 0, 4, 5, 0) );
