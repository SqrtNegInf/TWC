#!/usr/bin/env raku

multi A(0, Int $n) { $n + 1 };
multi A(Int $m, 0) { A($m - 1, 1) };
multi A(Int $m, Int $n) { A($m - 1, A($m, $n - 1)) };


#multi MAIN('test') {
    use Test;

    # As is known, the Ackerman function grows fast. Hence we only test the
    # Ackermann function for some small values.
    is A(1, 2), 4;
    is A(1, 1), 3;
    is A(2, 2), 7;
    is A(3, 3), 61;
#}
