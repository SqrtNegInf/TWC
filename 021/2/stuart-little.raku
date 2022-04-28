#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle Perl5' if $*VM ~~ /jvm/;

use URI:from<Perl5>;

say URI.new(@*ARGS[0]).canonical.Str;

