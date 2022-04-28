#!/usr/bin/env raku

sub MAIN (Str $string = 'bookkeeper') {

    $string.match: / ( $<l>=<.alpha> $<l>* )+ /;    # Quantified capture yields array $/[0] of Match objects
    say $/[0][*].Str;                               # Stringify each Match object to see the overall match

}
