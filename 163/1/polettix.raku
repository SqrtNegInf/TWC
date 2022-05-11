#!/usr/bin/env raku

sub MAIN (@n = <1 2 3 10>) { put sb(|@n) }

multi sub sb  ()            { 0                         }
multi sub sb  ($n)          { $n                        }
multi sub sb  ($n, $m)      { $n +& $m                  }
multi sub sb  ($n, *@r)     { sbf($n, |@r) + sb(|@r)    }
multi sub sbf ($n, $m)      { sb($n, $m)                }
multi sub sbf ($n, $m, *@r) { sb($n, $m) + sbf($n, |@r) }
