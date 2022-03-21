#!/usr/bin/env raku

unit sub MAIN($a = 'aab', $b = 'ggh');

my &single = -> $string { $string.subst: /(.)$0*/, {" $0"}, :g }
my &equal  = -> $a, $b  { $a eq $b.trans(single($b) => single($a)) }

say +(equal($a, $b) && equal($b, $a))
