#!/usr/bin/env raku
use MONKEY-SEE-NO-EVAL;

sub MAIN(@array where @array.all ~~ /^\d+$/ = ^4) {
    for @array.permutations.map(~*).unique {
        .say if EVAL (.comb(/\d/) <<Z~>> (" >= ", " <= "))
        .subst(/\s.\=\s$/, q{});
    }
}
