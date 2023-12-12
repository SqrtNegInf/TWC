#!/usr/bin/env raku

sub MAIN( @in = (1, 1, 2, 3, 5) ) {
    my ($p, $q, @a) = @in».Int;

    for ^3 {
        @a.push: $p × @a[*-2] + $q × @a[*-1];
    }

    say "P $p   Q $q   Ary:  @a.raku()";
}

