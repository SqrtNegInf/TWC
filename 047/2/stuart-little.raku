#!/usr/bin/env raku

(100..*).grep({ $_ %% ($_.comb[0] ~ ($_ % 10)).Int }).[0..^20].say
