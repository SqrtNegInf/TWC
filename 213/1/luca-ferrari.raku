#!/usr/bin/env raku

my @n = <1 2 3 4 5 6>;
( @n.grep( * %% 2 ).sort.join( ',' ) ~ ',' ~ @n.grep( * !%% 2 ).sort.join( ',' ) ).say;
