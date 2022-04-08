#!/usr/bin/env raku

sub versprcs($v) {
    $v.comb.map({ $_.Int || $_ }).map({ $_ ~~ Str && $_.trans(['.','_']=>['_','.']) || $_ })
}

say ('1.2.1'.&versprcs cmp '1.2_2'.&versprcs).Int
