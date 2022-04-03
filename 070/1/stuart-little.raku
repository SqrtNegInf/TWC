#!/usr/bin/env raku

sub swp(Str $s, Int $c, Int $o where { $c <= $o && $c+$o <= $s.chars }) {
    $s.substr(0,1) ~ $s.substr(1+$o, $c) ~ $s.substr($c+1..$o) ~ $s.substr(1, $c) ~ $s.substr($c+$o+1)
}

say swp('perlandraku', |(3,4).map(*.Int) );

# run as <script> <string count offset>
