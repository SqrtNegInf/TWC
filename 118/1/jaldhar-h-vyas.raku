#!/usr/bin/env raku

sub MAIN(
    Int $N = 99
) {
    my $binary = $N.base(2);
    say ($binary eq $binary.flip) ?? 1 !! 0;
}
