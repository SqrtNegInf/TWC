#!/usr/bin/env raku
unit sub MAIN(@A =(7, 8, 3, 12, 10));

@A.kv.map(-> $k,$v {(@A.head($k+1).grep(* < $v) or 0).min}).join(", ").List.say;
