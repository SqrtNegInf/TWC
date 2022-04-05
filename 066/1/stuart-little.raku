#!/usr/bin/env raku

multi sub awkdiv(Int $n, 0) {   
    "You're dividing by zero!"
}

multi sub awkdiv(0, Int $d) {   
    0
}

multi sub awkdiv(Int $n, Int $d where {sign($_) == sign $n}) {
    given $d.abs {
	when * > $n.abs {0}
	default { 1+ awkdiv(($n-$d).abs,$d.abs)}
    }
}

multi sub awkdiv(Int $n, Int $d where {sign($_) !== sign $n}) {
    given $d.abs {
	when * > $n.abs {-1}
	default { -1+ awkdiv(($n+$d).abs,-$d.abs)}
    }
}

say awkdiv(11,3);

# run as <script> <numerator> <denominator>
