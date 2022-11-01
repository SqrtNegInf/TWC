#!/usr/bin/env raku

sub MAIN(
    Int $x is copy = 4, #= a positive integer
    Int $y is copy = 6  #= a positive integer
) {
    my $operations = 0;

    repeat {
        my $prevX = $x;

        if $x >= $y {
            $x -= $y;
        }
        
        if $y >= $prevX {
            $y -= $prevX;
        }

        $operations++;

    } until $x == 0 && $y == 0;

    say $operations;
}
