#!/usr/bin/env raku

sub MAIN(Int $n = 2⁶⁴ +1) {
    my $flip = $n.base(2);
    say (:2($flip) +^ :2(1 x $flip.chars));
}
