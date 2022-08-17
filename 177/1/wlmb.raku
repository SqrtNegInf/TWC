#!/usr/bin/env raku

my @table= <0317598642 7092154863 4206871359 1750983426 6123045978 3674209581
            5869720134 8945362017 9438617205 2581436790>.map({.comb.map({.Int})});
(5724).map({say "$^x ", (unshift($^x.comb.Array,0).reduce({@table[$^a][$^b]}))==0??
         "is"!!"isn't", " correct"});
