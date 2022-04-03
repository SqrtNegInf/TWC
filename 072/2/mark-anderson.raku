#!/usr/bin/env raku

unit sub MAIN(Str $file = 'input.txt', UInt $from = 3, UInt $to where 1 <= $from <= $to = 6);
 
print |$file.IO.lines(chomp => False)[$from-1 .. $to-1];
