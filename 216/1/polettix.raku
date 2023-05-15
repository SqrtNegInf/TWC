#!/usr/bin/env raku

my $code = 'AB1 2CD'; 
my @words = ('abc', 'abcd', 'bcd');
my @code = $code.lc.subst(/ <-[ a..z ]>/, '', :g).comb.Set;
@words.grep({ @code ⊆ .lc.comb }).join(', ').put;
