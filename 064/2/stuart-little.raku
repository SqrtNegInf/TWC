#!/usr/bin/env raku

sub partw($w,@a,@acc) {
    $w eq '' && return @acc;
    @a.map({ $w.starts-with($_) && (partw($w.substr($_.chars),@a,(|@acc,$_))) })
    .grep( *.so )
}

partw("perlweeklychallenge", ("weekly", "challenge", "perl"),()).map(*.flat).say
