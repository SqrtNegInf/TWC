#!/usr/bin/env raku
use v6;

# run as <script> <space-separated point coordinates>, as in <script> p1x p1y p2x p2y ..

sub collinp($p,$q,$x) {
    ($x.[1]-$p.[1])*($q.[0]-$p.[0]) == ($q.[1]-$p.[1])*($x.[0]-$p.[0])
}

sub maxcollin(@pts) {
    @pts.combinations(2).map( -> ($p,$q) { @pts.grep( -> $x {collinp($p,$q,$x)}).elems }).max
}

    say <1 1 1 3 2 2 3 1 5 3>.map(*.Int).rotor(2).&maxcollin
