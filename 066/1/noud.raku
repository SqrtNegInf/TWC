#!/usr/bin/env raku

sub tedious-div($m, $n) {
    if (abs($m) < abs($n)) {
        if ($m >= 0) {
            return 0;
        } else {
            return -1;
        }
    } elsif ($m > 0 && $n > 0) {
        return 1 + tedious-div($m - $n, $n);
    } elsif ($m < 0 && $n > 0) {
        return -1 + tedious-div($m + $n, $n);
    } else {
        return tedious-div(-$m, -$n);
    }
}

tedious-div(5, 2).say;
tedious-div(-5, 2).say;
tedious-div(-5, -2).say;
tedious-div(5, -2).say;
