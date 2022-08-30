#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle Perl5' if $*VM ~~ /jvm/;

use Lingua::EN::Numbers:from<Perl5> <num2en_ordinal>;

say num2en_ordinal(11);
say num2en_ordinal(62);
say num2en_ordinal(99);


