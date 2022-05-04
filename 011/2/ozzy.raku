#!/usr/bin/env raku

sub MAIN (Int $dim = 5)
{
    my @md[$dim;$dim];

    for 0..$dim-1 -> $i {
        for 0..$dim-1 -> $j {
            @md[$i;$j]= $i==$j ?? 1 !! 0;
            printf "%3i", @md[$i;$j];
        }
    printf "\n";
    }
}
