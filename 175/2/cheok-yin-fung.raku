#!/usr/bin/env raku

use Prime::Factor;

sub totient ($n) {
    my $x = 1;
    my @s = prime-factors($n).unique;
    for (2..$n-1) {
        $x++;
        for (@s) -> $i {
            if ($_ % $i == 0) {
                $x--;
                last;
            }
        }
    }
    return $x;
}



my $p = 0;
#loop (my $n0 = 3; $n0 < 1_000_000_000; $n0 += 2 ) {
loop (my $n0 = 3; $n0 < 2200; $n0 += 2 ) {
    my $n = $n0;
    my $sum = 0;
    repeat {
        $n = totient($n);
        $sum += $n;
    } until ($sum > $n0 || $n == 1);
    if ($sum == $n0) {
        say $n0;
        $p++;
    }
    last if $p >= 20;
}

