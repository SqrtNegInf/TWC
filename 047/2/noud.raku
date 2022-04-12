#!/usr/bin/env raku

my @gapful = (100..Inf).grep({
    $_ % Int(Str($_).comb[0] ~ Str($_).comb[*-1]) == 0
});

@gapful[^20].say;
