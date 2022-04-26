#!/usr/bin/env raku

my ($n, @list) = flat 1, (5, 9, 2, 8, 1, 6);


(@list = map {@list[$_]-@list[$_-1]},1..@list.end) for 1..$n;

say "@list[]";
