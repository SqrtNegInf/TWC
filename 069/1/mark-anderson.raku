#!/usr/bin/env raku

sub MAIN(UInt $A=1, UInt $B = 200) {
    for $A..$B -> $num {
        next if $num ~~ /<-[01689]>/;
        say $num if $num.flip.trans("69" => "96") eq $num;
    }
}
