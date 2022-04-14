#!/usr/bin/env raku

multi sub MAIN(@ARGS = <The quick brown fox jumps over the lazy dog>) {
    my $input = @ARGS.lc.join(q{ }).subst(/\s+/, q{}, :g);
    $input ~= q{ } x 8 - ($input.chars % 8); 
    ([Z~] $input.comb.rotor(8)).join(q{ }).subst(/' '+/, q{ }, :g).say;
}
