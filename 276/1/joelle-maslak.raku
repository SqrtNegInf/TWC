#!/usr/bin/env raku

#sub MAIN(Str:D $numberstr is copy) {
    my @hours = (12, 12, 24, 24,         30);

    say @hours.combinations(2).grep(*.sum %% 24).elems;
#}
