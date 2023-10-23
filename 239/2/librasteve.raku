#!/usr/bin/env raku

die 'no dice, maybe an earlier version of Raku?';

#use v6.e.PREVIEW;
say +<ad bd aaab baa badab>.grep(*.comb ⊆ .comb);
