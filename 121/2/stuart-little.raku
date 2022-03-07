#!/usr/bin/env raku
use v6;

# run <script> <nr of cities>

#sub mkRMat($n) {
#    [1..$n].map(-> $i { [1..$n].map(-> $j {($i==$j) ?? (0) !! (9.rand.Int+1)}).Array }).Array
#}

sub sayMat(@m) {
    for (@m) {.say}
}

sub pathCost(@path,@mat) {
    return (0..^@path.elems).map({ @mat.[@path.[$_]].[@path.[($_+1)% @path.elems]] }).sum
}

#my @mat = mkRMat(5);

my @mat =
    (
        ( 0, 5, 2, 7 ),
        ( 5, 0, 5, 3 ),
        ( 3, 1, 0, 6 ),
        ( 4, 5, 4, 0 ),
    );

say "Your matrix:";
sayMat(@mat);

my @sol = (^4).permutations.min(-> @p { pathCost(@p,@mat) }).Array;
say "Optimal cost: {pathCost(@sol,@mat)}";
say "Optimal Path: {@sol} @sol[0]";
