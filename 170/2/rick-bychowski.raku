#!/usr/bin/env raku

sub MAIN( @a = [<1 2>, <3 4>], @b = [<5 6>, <7 8>] ) {
    for kronecker(@a, @b) -> @row {
        printf("[ %2d %2d %2d %2d ]\n", @row);
    }
}

sub kronecker(@a where {.elems == 2}, @b where {.elems == 2}){
    return (@a X @b).map: { .[0].flat X* .[1].flat };
}
