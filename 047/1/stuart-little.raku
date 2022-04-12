#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle Perl5' if $*VM ~~ /jvm/;

use MONKEY-SEE-NO-EVAL;
use Roman:from<Perl5>;

say EVAL <V + VI>.map({ (isroman($_)) ?? (arabic($_)) !! ($_) }).join(" ")
