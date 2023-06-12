#!/usr/bin/env raku
use Test;

is-deeply squareful1(1, 17, 8), ((1, 8, 17), (17, 8, 1));
is-deeply squareful1(2, 2, 2),  ((2, 2, 2),);
is-deeply squareful2(1, 17, 8), ((1, 8, 17), (17, 8, 1));
is-deeply squareful2(2, 2, 2),  ((2, 2, 2),);

sub squareful1(+@a)
{
    @a.permutations.unique(with => &[eqv])
                   .grep({ all(.rotor(2 => -1)).sum.sqrt.narrow ~~ UInt })
}

sub squareful2(+@a)
{
    my $s = @a.sort.tail(2).sum;

    my $squares := (0..$s Z* 0..$s).List;

    @a.permutations.unique(with => &[eqv])
                   .grep({ .rotor(2 => -1)>>.sum (<=) $squares })
}
