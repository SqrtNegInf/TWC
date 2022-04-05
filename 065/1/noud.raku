#!/usr/bin/env raku

sub digits-sum($N = 2, $S = 10) {
    ([X] ((1..9), |(^9 xx ^($N-1)))).grep({ ([+] $_) eq $S; }).map({ [~] $_ });
}

digits-sum(2, 4).say;
