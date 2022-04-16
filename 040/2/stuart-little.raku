#!/usr/bin/env raku

sub selord(@a,@i) {
    (|(@i Z=> @a.pairs.grep(*.key == @i.any).sort(*.value).map(*.value)), |@a.pairs.grep(*.key !== @i.any))
    .sort(*.key)
    .map(*.value)
}

say selord('10,4,1,8,12,3'.split(',').map(*.Int), '0,2,5'.split(',').map(*.Int))
