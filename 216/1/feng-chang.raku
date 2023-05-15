#!/usr/bin/env raku

my @words = ('abc', 'abcd', 'bcd');

my $regs = @words.pop.lc.comb.grep(/<[a..z]>/).Set;
put @words.grep({ .comb.Set (>=) $regs }).map({ "'$_'" }).join(', ');
