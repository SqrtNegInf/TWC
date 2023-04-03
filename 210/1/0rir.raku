#!/usr/bin/env raku

use Test;

my @Test =
    [<2 3 1                              >],          6,
    [<6 7 8      10                      >],         21,
   
    [<100                                >],         100,
    [<1 1 2 2 2 3 3                      >],          14,
    [<1 1 1 1 1 1 2                      >],           8,
    [<2 1 1 1 1 1 1                      >],           8,
    [<1 1 2 2 2 3 3 4 4 4 6 7  100       >],         100,
    [<1 1   2 2 2 3 3 4 4 4    5 6 7     >],          24,
    [<1 1      2 2 2 3 4       5 8       >],          13,
;

sub sum-all-occurances-me-precessor-successor ( Int @a --> Int)  {

    my Int %h{Int};
    my Int %s{Int};

    for @a -> $val { %h{$val} += $val }
    for %h.keys -> $k {
        %s{$k} = %h{$k} + (%h{$k -1} // 0) + ( %h{$k+1} // 0);
    }
    %s.values.max;
}

plan @Test/2;

for @Test -> @proto-in, $exp {
    my Int @in = @proto-in.map( *.Int);
    is sum-all-occurances-me-precessor-successor(@in), $exp, '';
}
done-testing;

my Int @int = [<1 1   2 2 2 3 3 4 4 4   5 6 7>].map( *.Int);

say "\nInput: @int = @int[]";
say "Output: &sum-all-occurances-me-precessor-successor(@int)";
