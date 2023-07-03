#!/usr/bin/env raku

use Test;

my @Test =
    (0,),                    0,
    (1,),                    1,
    (1, 2),                  4,
    (1, 5),                 10,
    (0, 1, 0),               1,
    (0, 1, 2),               4,
    (1, 5, 1),              15,
    (3, 1, 5, 8),          167,
    (0, 1, 0, 0, 2, 0, 0),   4,
    (1, 5, 1, 5, 1),        65,
;

plan @Test ÷ 2;

sub brute( @input where { .all > -1} -->Int) {
    my @in = @input.grep( * ≠ 0 );      # Ignore empty bags.
    my @order = (^@in).permutations;
    my $score = 0;
    for @order ->@o {
        my $s = score-a-perm @in, @o;
        $score < $s and $score = $s;
    }
    return $score;

                            #  not reached
    sub score-a-perm( @a, @perm -->Int) {
        my @wip = @a;
        my $score = 0;

        for @perm -> $i { $score += triplet( @perm, $i); }
        return $score;

            # not reached
            # find elem's triplet, destroy the elem, return triplet's value
        sub triplet( @perm, $i -->Int) {
            my $return = [×] L( $i), @wip[$i], R( $i);
            @wip[$i] = Any;
            return $return;

                # not reached
            sub L( $i ) {   
                   my $k = @wip[ ^$i].first( *.defined, :k, :end);
                   return 1 without $k;
                   return @wip[$k];
            }
            sub R( $i) {
                   my $k = @wip[$i^..^@wip].first( *.defined, :k);
                   return 1 without $k;
                   return @wip[$i+$k+1];
}   }   }   }

for @Test -> @in, $exp {
    is brute(@in), $exp, "$exp <- @in.raku()"
}
done-testing;

my @box = (1,5,1,8,1);
say "\nInput: @box = @box[]\nOutput: &brute(@box)";

