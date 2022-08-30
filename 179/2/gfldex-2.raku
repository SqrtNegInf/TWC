#!/usr/bin/env perl6
## from https://gfldex.wordpress.com/2022/08/28/data-sparkle/
#    2022-08-30

constant &sparks = {
    constant @sparks = "▁" .. "█";
    constant \steps = +@sparks - 1;

    &postcircumfix:<[ ]>.assuming(@sparks) but role :: { has $.steps = steps }
}.();

my @data = <2 4 6 8 10 12 10 8 6 4 2>;

my $scale := @data.&{ (.max - .min) / &sparks.steps };
((@data »-» @data.min) »/» $scale)».round.&sparks.join.put;

# <2 4 6 8 10 12 10 8 6 4 2>, <0 1 19 20>, <0 999 4000 4999 7000 7999>;
