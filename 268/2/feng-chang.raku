#!/usr/bin/env raku

#unit sub MAIN(*@ints where +@ints %% 2);
my @ints = (2, 5, 3, 4);

put @ints.sort.map({ $^b, $^a });
