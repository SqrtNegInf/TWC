#!/usr/bin/env raku

unit sub MAIN(@N = (2,6,3,1));

my \m = @N.max;
put @N.grep(!(* == m)).any * 2 > m ?? -1 !! 1;
