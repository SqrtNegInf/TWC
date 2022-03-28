#!/usr/bin/env raku
unit sub MAIN( Int $N = 100, Int $M = 500 );

say "({ join ', ', grep all( $N, $M ) %% *, 1 ..^ max $N, $M })"
