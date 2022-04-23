#!/usr/bin/env raku

for ((@*ARGS) ?? @*ARGS[0] !! 'Perl {Daily,Weekly,Monthly,Yearly} Challenge')
.words
.map({ ($_ ~~ /^\{(.*)\}$/) ?? ($0.Str.split(',')) !! ($_,) })
.reduce(&infix:<X>).map(*.join(' ')) {.say}


