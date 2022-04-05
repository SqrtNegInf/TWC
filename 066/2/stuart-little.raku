#!/usr/bin/env raku

sub pws(Int $n) {
    (2..$n.sqrt).grep({ $_ ** log($n,$_).Int == $n }).map({ $_, log($n,$_) })
}

say pws 64;
