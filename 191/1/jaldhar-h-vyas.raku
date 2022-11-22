#!/usr/bin/env raku

sub MAIN( @list = (2,6,3,1) ) {
    my @sorted = @list.sort;
   
    say @sorted[*-2] * 2 <= @sorted[*-1] ?? 1 !! -1;
}
