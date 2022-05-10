#!/usr/bin/env raku

say $_ % 15??$_ % 5??$_ % 3??$_!!'fizz'!!'buzz'!!'fizzbuzz' for 1..20
