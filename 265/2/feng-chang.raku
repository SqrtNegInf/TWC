#!/usr/bin/env raku

unit sub MAIN(Str:D $str = 'JB 007', @strs = ['jj', 'bb', 'bjb']);

my %seed = $str.lc.comb.grep('a'..'z').Bag;
put @strs.grep(*.comb.Bag (>=) %seed).first(*.chars);
