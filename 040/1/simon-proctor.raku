#!/usr/bin/env raku

# Note the challenge asks for arrays but passing in strings is just easier.

my @inputs = <abc def ghi>;
([Z] @inputs.map(*.comb)).map(*.join(' ').say);
