#!/usr/bin/env raku

# run <script> <x1 y1 x2 y2 ..>

sub sqDist($x1, $y1, $x2, $y2) {
    return ($x2-$x1)**2 + ($y2-$y1)**2;
}

sub sqDistHash(@coords) {
    my %h;
    @coords.rotor(2).combinations(2).map({ sqDist(|$_.[0], |$_.[1]) }).map({ %h{$_}++ });
    return %h;
}

sub isSq(@coords) {
    my @distCounts = sqDistHash(@coords).values;
    return (@distCounts.grep(2) && @distCounts.grep(4)).Bool;
}

say isSq((12,24, 16,10, 20,12, 18,16).map(*.Num)).Int;
