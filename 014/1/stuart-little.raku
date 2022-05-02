#!/usr/bin/env raku

say (0, sub (*@a) { my $ix = @a[0..*-2].reverse.first(@a[*-1], :k); ($ix ~~ Int) ?? $ix+1 !! 0 } ... *).[0..^((@*ARGS) ?? @*ARGS[0].Int !! 50)]
