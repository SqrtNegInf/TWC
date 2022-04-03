#!/usr/bin/env raku

unit sub MAIN ($a = 3, $b = 6, $file = 'input.txt');
$file.IO.lines.head($b).skip($a-1)».say
