#!/usr/bin/env raku

sub MAIN(
    @args = (5,4,4,3)
) {
    my @array = @args.sort({ $^b <=> $^a }).unique;
    say @array.elems > 2 ?? @array[2] !! @array[0];
}
