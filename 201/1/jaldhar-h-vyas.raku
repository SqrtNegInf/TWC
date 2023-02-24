#!/usr/bin/env raku

sub MAIN( @array= (0, 1, 3, 5, 9, 10)) {
    my @need = 0 .. @array.elems;
    my Set $missing = @need ∖ @array.map({ $_.Int });

    $missing.keys.sort.join(q{, }).say;
}
