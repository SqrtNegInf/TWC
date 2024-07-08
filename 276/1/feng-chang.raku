#!/usr/bin/env raku

#unit sub MAIN(*@hours);
my @hours = (12, 12, 24, 24,         30);

put +@hours.combinations(2).grep(*.sum %% 24);
