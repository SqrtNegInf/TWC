#!/usr/bin/env raku

sub MAIN(
    Int $x = 7, Int $y = 2, Int $z = 3, @array = (3,0,1,1,9,7) 
) {
    my @goodtriplets;

    for 0 .. @array.end -> $i {
        for $i ^.. @array.end -> $j {
            for $j ^.. @array.end -> $k {
                if (@array[$i] - @array[$j]).abs <= $x &&
                   (@array[$j] - @array[$k]).abs <= $y &&
                   (@array[$i] - @array[$k]).abs <= $z {
                        @goodtriplets.push(@array[$i,$j,$k]);
                }
            }
        }
    }

    @goodtriplets.elems.say;
}
