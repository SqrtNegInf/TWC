#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle Perl5' if $*VM ~~ /jvm/;

use Math::BigFloat:from<Perl5>;

say Math::BigFloat.new('1').bexp((@*ARGS) ?? @*ARGS[0] !! 30).Str
