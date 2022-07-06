#!/usr/bin/env raku

my sub proper-divisors(\n) { grep n %% *, ^n }
my sub is-abundant-odd(\n) { return False if n %% 2; n < [+] proper-divisors n }
(^∞).grep(&is-abundant-odd).head(20)».say
