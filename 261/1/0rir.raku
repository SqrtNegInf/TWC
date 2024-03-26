#!/usr/bin/env raku

use Test;

my @Test =
    0,      0,       (1,2,3,4),
    0,      0,       (0,1,2,3,4),
    9,      9,       (1,12,3),
    36,     36,      (1,2,3,45),
    1296,   1296,    (236, 416, 336, 350),
    9,      9,       (1,2,3,15),
    -33,    -9,      (-1,-2,-3,-15),
    -21,    -9,      (1,2,3,-15),
    -21,    -9,      (0,1,2,3,-15),
    624,   648,    (236, 416, -336, 350),
;

plan @Test ÷ 3; # × 2;

# alway consider "digits" to be positive
multi digit-sum( $a, Bool:D :$unsigned!  -->Int) {
    $a.sum - sum $a.map: { sum .abs.Str.comb».Int };
}
# consider "digits" to inherit the sign of the containing number
multi digit-sum( $a -->Int) {
    $a.sum
    - sum $a.map({
         if $_ > 0 {   sum .Str.comb».Int; }
         else      { - sum .abs.Str.comb».Int; }
     })
}

for @Test -> $pos, $signed, $in {
    #is digit-sum($in, :unsigned), $pos,    "$pos\t<- $in :unsigned digits";
        is digit-sum($in           ), $signed, "$signed\t<- $in";
}

done-testing;
my $ints = (1, 2, 3, -15);
say "\nInput: \$ints = $ints.raku()\nOutput: &digit-sum($ints, :unsigned)";
