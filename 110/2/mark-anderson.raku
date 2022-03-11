#!/usr/bin/env raku

say .map(*.join(",")).join("\n") given 
    
[Z] "example.csv".IO.lines.map(*.split(",")); 
