#!/usr/bin/env raku

use Test;

my @Test =
    (3,2,3,2,2,2),  ((2,2), (3,3), (2,2)),
    (1,2,3,4),      (),
    (1,1,2,2,2,2,3,3,3,3,3,3,4,4),
                    ((1,1), (2,2), (2,2), (3,3),(3,3),(3,3),(4,4)),
;
my @Triplet =
    (3, 2, 3, 2, 2, 2), (),
    (3, 3, 3, 2, 2, 2), ((2, 2, 2), (3, 3, 3)),
    (1, 2, 3, 4), (),
    (1,1,1), (1,1,1),
;
plan @Test ÷ 2 + @Triplet ÷ 2;

sub equal-sets( $a is copy, Int $size = 2 -->List) {
    my $ret;
    $a.=BagHash;
    for @$a -> $p {
        return () unless (my $set-ct = $p.value ÷ $size) == $set-ct.floor;
        $ret.append: ($p.key xx $size) xx $set-ct;
    }
    $ret.List;
}

for @Test -> $in, $exp {
    is equal-sets($in).sort( *[0]), $exp.sort( *[0]),
        "Sorted Pairs    $exp.sort().List.raku() < $in.raku()";
}
for @Triplet -> $in, $exp {
    is equal-sets($in,3).sort, $exp.sort,
        "Sorted Triplets $exp.sort().List.raku() < $in.raku()";
}
done-testing;

#my  @int = (1,1,2,2,2,2,3,3,3,3,3,3,4,4);
#say "\nInput: @int = (@int[])\nOutput: &equal-sets( @int)<>.raku()";
