#!/usr/bin/env raku
# Can be shortened to: return ( @a, { [\+] .skip } … { .elems == 1 } ).tail.[0];

my @a = (1,5,4,3,2,6,7);
say ( @a, { [\+] .skip } … { .elems == 1 } ).tail.[0];

say '--';

sub skip-sum ( @a is copy ) {

    while @a > 1 {
        @a .= skip;
        @a .= produce: &[+];
    }

    return @a.head;
}


my @tests =
    (1,2,3,4,5) => 42,
    (1,3,5,7,9) => 70,
    (1,5,4,3,2,6,7) => 527,
;
use Test;
plan +@tests;
for @tests -> ( :key(@in), :value($expected) ) {
    my $got = skip-sum(@in);
    is $got, $expected, "skip-sum(@in[]) == $expected";
}
