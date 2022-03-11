#!/usr/bin/env raku

unit sub MAIN (Str $file where *.IO.f = "example.csv");

.say for zip($file.IO.lines.map(*.split(","))).map(*.join(","));
