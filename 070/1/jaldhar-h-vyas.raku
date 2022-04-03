#!/usr/bin/env raku

multi sub MAIN(
    Int $C  =3 , #= swap count
    Int $O  =4 , #= offset
    Str $S  #= string (length <= count + offset)
    where { $C >= 1 && $O >= 1 && $C <= $O && ($C + $O) <= $S.chars} = 'perlandraku'
) {
    my $N = $S.chars;
    my @chars = $S.comb;

    for 1 .. $C -> $i {
        my $a = $i % $N;
        my $b = ($i + $O) % $N;
        my $temp = @chars[$a];
        @chars[$a] = @chars[$b];
        @chars[$b] = $temp;
    }

    @chars.join(q{}).say;
}
