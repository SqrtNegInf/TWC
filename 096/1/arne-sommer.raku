#!/usr/bin/env raku

unit sub MAIN ($S = 'The Weekly Challenge');

say '"' ~ $S.words.reverse.join(" ") ~ '"';
