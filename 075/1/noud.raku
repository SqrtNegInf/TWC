#!/usr/bin/env raku

sub coins-sum(@C, $S) {
    if ($S == 0) {
        return [(),];
    }

    my @ret = [];
    for @C -> $c {
        if ($c <= $S) {
            for coins-sum(@C, $S - $c) -> @r {
                if ($c <= @r.min) {
                    @ret.push([$c, |(@r)]);
                }
            }
        }
    }
    return @ret;
}

coins-sum((1, 2, 4), 6).say;
