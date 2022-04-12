#!/usr/bin/env raku

my @gapful = (100..∞).grep: &is-gapful;
say @gapful[^20];

sub is-gapful( Int \n ) { n ≥ 100 and n %% n.comb[0,*-1].join }
