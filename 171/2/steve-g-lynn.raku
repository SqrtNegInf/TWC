#!/usr/bin/env raku

sub f($x) {$x+1}
sub g($x) {$x*3}

my &h = &g o &f;

say &h(5); #-- 18


