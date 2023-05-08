#!/usr/bin/env raku

my @words = ('abc', 'xyz', 'tsu');
say ( @words.elems -  @words.grep( { $_ ~~ $_.comb.sort.join } ).elems );
