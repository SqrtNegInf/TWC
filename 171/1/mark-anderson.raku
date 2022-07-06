#!/usr/bin/env raku

use Prime::Factor;

say (1,3...*).grep({ $^n < [+] proper-divisors($^n) }).head(20);
