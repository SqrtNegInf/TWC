#!/usr/bin/env raku

#unit sub MAIN (Int $N where $N != 0, Int $D where $D != 0);

for (flat (1, 3), (1, 2), (5, 66), (1, 7), (1.1, 8.5)) -> $N, $D {
    my $rat = $N / $D;
    my ($base, $rep) = $rat.base-repeating;
    say $base, ( $rep ?? "($rep)" !! '' ) 
} 
