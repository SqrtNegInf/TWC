#!/usr/bin/env raku

sub maximum-ones(@matrix --> Int) {
    my @sums = map({ .sum }, @matrix);
    1 + @sums.first: * == max(@sums), :k;
}

#multi sub MAIN('test') {
    use Test;
    plan 3;

    is maximum-ones([ [0, 1],
                      [1, 0],
                    ]), 1, 'works for matrix one';
    is maximum-ones([ [0, 0, 0],
                      [1, 0, 1],
                    ]), 2, 'works for matrix two';
    is maximum-ones([ [0, 0],
                      [1, 1],
                      [0, 0],
                    ]), 2, 'works for matrix three';
#}
