#!/usr/bin/env raku

sub diffk($k,@a) {
    (&{$_}, &{$_.map(*.reverse)}).map({|@a.keys.combinations(2).$_}).grep({ @a[$_[0]]-@a[$_[1]] == $k }) || "nothing"    
}

say diffk(2, (2, 7, 9).map(*.Int))
