#!/usr/bin/env raku

sub MAIN(
    Str $str = "ballerina",
    Str $chr = 'e'
 ) {
    $str.comb.classify({ $_ }, into => my %freq);
    say %freq{$chr}:exists ?? (%freq{$chr}.elems / $str.chars * 100).round !! 0;
}
