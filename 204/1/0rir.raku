#!/usr/bin/env raku

use Test;

my @Test =
    (Empty) =>   Bool,
    (1,2,2,3) => True,
    (1,3,2)   => False,
    (6,5,5,4) => True,
;

multi monotonic( Empty ) { Bool }
multi monotonic( $list --> Bool) {
    my $l = $list.sort.List;
    $list ~~ $l or $list ~~ $l.reverse;
}

plan +@Test;
for @Test -> ( :key($in), :value($exp)) {
    is monotonic($in), $exp, "$in.raku() -> monotonic $exp.gist()";
}
done-testing;


print "\n";
my @num = (1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19),
          (1,2,3,4,5,6,7,8,9,10,11,11,11,12,13,14,15,15,15,15,16,17,19);

for 0..^@num {
say "Input: @num = @num[$_]
Output: &monotonic(@num[$_]).Int()";
}
