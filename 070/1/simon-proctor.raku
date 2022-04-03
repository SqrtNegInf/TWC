#!/usr/bin/env raku

#| Given a string, swap count and offset swap characters in the string
sub MAIN (
    Str $S = 'perlandraku', #= String to manipulate
    UInt $C =3, #= Swap count
    UInt $O where { $C <= $O && $C + $O <= $S.codes } = 4, #= Offset
) {
    my @swaps = $S.comb;
    my $N = $S.codes;
    for 1..$C -> $i {
        my $x = $i % $N;
        my $y = ($i+$O) % $N;
        @swaps[$x,$y] = @swaps[$y,$x];
    }
    
    @swaps.join("").say;
}
