#!/usr/bin/env raku

use Math::Matrix;

sub intersect(($a,$b,$c,$d,$p,$q,$r,$s)) {
    ($d-$b)*($r-$p) == ($c-$a)*($s-$q) && return "The lines have equal slope: no unique intersection.";
    my $A = Math::Matrix.new([[$b-$d,$c-$a],[$q-$s,$r-$p]]);
    my $v=Math::Matrix.new([[$b*$c-$a*$d],[$q*$r-$p*$s]]);
    return $A.inverted.dot-product($v);
}

say quietly intersect(<1 1 3 3 1 3 3 1>)
