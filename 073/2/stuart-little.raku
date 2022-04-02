#!/usr/bin/env raku

sub slide(@a) {
    (0..^@a).map({ (@a.[0..$_].min < @a[$_]) ?? (@a[0..^$_].min) !! (0) })
}

say slide((7, 8, 3, 12, 10).map(*.Int));
