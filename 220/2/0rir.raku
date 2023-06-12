#!/usr/bin/env raku
use Test;

my @Test =
    # exp               in
    (1,17,8),           ((1,8,17), (17,8,1)),
    (2,2,2),            ((2,2,2),),
    (1,24),             ((1,24),(24,1),),
    (1,3,6,10,15,10),   ((1,3,6,10,15,10),(3,1,15,10,6,10),(10,6,3,1,15,10),
                         (10,6,10,15,1,3),(10,15,1,3,6,10),( 10,15,10,6,3,1),),
    (1,6,9,10), (( Empty),),
;
plan @Test ÷ 2;

# is a one-dim array squareful
sub squareful( @a -->Bool) {
    my $r = 0..1;
    for 1..^@a {
        my $sqr = @a[@$r].sum.sqrt;
        return False if $sqr != $sqr.Int;
        $r += 1;
    }
    True
}

sub all-squareful-perms( @a -->List ){
    @a.permutations.grep( *.&squareful).unique( :with(&[eqv])).List;
}

for @Test -> @in, @exp {
    my $r = all-squareful-perms(@in);
    is $r, @exp, "@exp.raku() <- @in.raku()";
}
done-testing;

my @int = (3,6,10,15);
say "\nInput: @ints = (@int[])\nOutput: ", all-squareful-perms(@int).raku;

