#!/usr/bin/env raku

use Test;

my @Test =
    # itemsA        itemsB          combined
    [],             [],             [],
    [ [1,1], [2,1], [3,2] ],
                [ [2,2], [1,3] ],
                                [ [1,4], [2,3], [3,2] ],

    [ [1,2], [2,3], [1,3], [3,2] ],
                [ [3,1], [1,3] ],
                                [ [1,8], [2,3], [3,3] ],

    [ [1,1], [2,2], [3,3] ],
                [ [2,3], [2,4] ],
                                [ [1,1], [2,9], [3,3] ],
;

plan @Test ÷ 3;

sub inventory-merge( $a, $b) {
    my %p{Int};
    for @$a.append( @$b) -> @e {  %p{ @e[0]} += @e[1]  }
    return (%p<>:kv).rotor(2)».Array .sort ;
}

for @Test ->  $a, $b, $exp  {
    is inventory-merge( $a, $b), $exp,
        $exp.gist
        ~ "\n    <- " ~ $a.gist ~ "  ∪  " ~ $b.gist;
}
done-testing;

my @ii = [ [1,1], [1,2], [1,90], [3,1000], [5,4]];
my @jj = [ [1,10], [10,2], [1,980], [6,1000], [5,5]];

say
"\nInput: \$items1 = @ii.gist()\n       \$items2 = @jj.gist()
Output: &inventory-merge(@ii,@jj).gist()";
