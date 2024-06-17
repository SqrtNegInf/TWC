#!/usr/bin/env raku

my @tests =
    perl => 'e',
    java => 'a',
    python => 'm',
    ada => 'a',
    ballerina => 'l',
    analitik => 'k';

for @tests -> $pair {
    say (100 * $pair.key.comb($pair.value) / $pair.key.comb).round;
    # say (100 * $pair.key.comb($pair.value).elems / $pair.key.comb.elems).round;
}
