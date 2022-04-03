#!/usr/bin/env raku

sub char-swap($S, $C, $O) {
    my $new-S = $S;
    for 1..$C -> $i {
        $new-S.substr-rw($i, 1) = $S.comb[$i + $O];
        $new-S.substr-rw($i + $O, 1) = $S.comb[$i];
    }
    return $new-S;
}

char-swap('perlandraku', 3, 4).say;
