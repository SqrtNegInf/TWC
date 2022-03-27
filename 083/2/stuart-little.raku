#!/usr/bin/env raku

sub cmpair($cap) {
    return -> @a, @b {
	(@b.sum <= $cap) ?? max(@a,(@b.sum,-@b.elems)) !! @a;
    }
}

my @A = <2 13 10 8>;
say -reduce(cmpair(@A.sum/2), (0,0), |@A.combinations).[1];

