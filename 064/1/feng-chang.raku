#!/usr/bin/env raku

my Int $M = 3;
my Int $N = 3;
my @Mat = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
];

my @Path[$M;$N];
@Path[0;0] = [@Mat[0;0]];

for 1 .. $M + $N - 2 -> Int $s {
    for (0, $s - $N + 1).max .. ($s, $M - 1).min -> Int $i {
        my Int $j = $s - $i;

        ($i > 0 ?? [+] @Path[$i-1;$j] !! ∞) < ($j > 0 ?? [+] @Path[$i;$j-1] !! ∞) ??
            (@Path[$i;$j] = @Path[$i-1;$j].clone) !!
            (@Path[$i;$j] = @Path[$i;$j-1].clone);

        @Path[$i;$j].append(@Mat[$i;$j]);
    }
}

say "{ [+] @Path[$M-1;$N-1] } ({ @Path[$M-1;$N-1].join(' -> ') })";
