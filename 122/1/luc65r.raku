#!/usr/bin/env raku

my@n =<10 20 30 40 50 60 70 80 90 100>;

.say for ([\+] @n) »/» (1..∞);
