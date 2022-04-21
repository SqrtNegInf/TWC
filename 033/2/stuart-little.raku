#!/usr/bin/env raku

my $n=(@*ARGS) ?? (@*ARGS[0].Int) !! (11);
for (1..$n).map({ my $d=($n**2).chars; |(sprintf("%{$d}s",'') xx ($_ - 1)), |($_ X* ($_..$n)).map({ sprintf("%{$d}d", $_) }) }) {.say}
