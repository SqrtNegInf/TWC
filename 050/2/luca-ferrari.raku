#!/usr/bin/env raku

sub MAIN( Int :$how-many where { $how-many >= 3 } = 3  ) {
    #my @L = (1..50).List.pick: $how-many;
    my @L = 19,11,9,7,20,3,17,16,2,14,1;

    # first approach: use a grep to count how
    # many elemnts are there
    my @nobel;
    for @L -> $a {
        @nobel.push( $a ) if @L.grep( { $a < $_  } ).elems == $a;
    }

    # second approach: sort the list, then
    # seek for every element that must have exactly
    # its value of numbers higher than it
    @L .= sort;
    for 0 .. @L.elems - 1 {
        @nobel.push( @L[ $_ ] ) if @L[ $_ ] == @L.elems - $_;
    }

    say @nobel;
}
