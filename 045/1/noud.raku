#!/usr/bin/env raku

sub encode($str) {
    # Lowercase all letters and remove white spaces.
    my $stripped = $str.lc.subst(/\s/, '', :g);

    # Extend string to multiple of 8 and rotate around 8.
    my @r = ($stripped ~ " " x (8 - $stripped.chars % 8)).comb.rotor(8, :partial);

    # Take Cartesian product of the rotated string.
    return ([Z~] @r).map({ $_.trim }).join(' ');
}

say encode("The quick brown fox jumps over the lazy dog");
