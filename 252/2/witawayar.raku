#!/usr/bin/env raku
my &fun = { list -$_ .. $_ given $^n div 2 }

use Test;
my @tests of UInt = 5, 3, 1;

for @tests -> $n {
    ok fun($n).sum == 0;
    LAST done-testing;
}
