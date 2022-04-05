#!/usr/bin/env raku

sub MAIN(Int :$m where { $m > 0 } = 5, Int :$n where { $n > 0 } = 3) {
    number-combinations($m, $n).say;
}

sub number-combinations(Int $m where { $m > 0 },
                        Int $n where { $n > 0 }) {
    $n > $m and say "ERROR: Invalid n=$n (n <= m)" and exit;

    return sprintf("[ %s ]",
           (1..$m)
           .combinations($n)
           .map({ '['~$_.join(',')~']' })
           .join(', '));
}
