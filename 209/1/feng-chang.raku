#!/usr/bin/env raku

unit sub MAIN(Str:D $s = '1110');

grammar SBC {
    token TOP       { <Character>* }
    token Character { '0' || '10' || '11' }
}

class SBC-Actions {
    state %chars = <0 10 11> Z=> <a b c>;

    method TOP($/)       { make $<Character>».made.join }
    method Character($/) { make %chars{$/.Str} }
}

put +so SBC.parse($s, :actions(SBC-Actions)).made ~~ /a$/;
