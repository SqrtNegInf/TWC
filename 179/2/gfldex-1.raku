#!/usr/bin/env perl6
## from https://gfldex.wordpress.com/2022/08/28/data-sparkle/
#    2022-08-30

constant @sparks = "▁" .. "█";
constant \steps = +@sparks - 1;

multi MAIN(
    #| space separated list of numbers
    *@data
) {
    my $scale := @data.&{ (.max - .min) / steps };
    put @sparks[((@data »-» @data.min) »/» $scale)».round].join;
}

multi MAIN(
    #| output an example sparkline-graph
    Bool :$test
) {
    .&MAIN for <2 4 6 8 10 12 10 8 6 4 2>, <0 1 19 20>, <0 999 4000 4999 7000 7999>;
}
