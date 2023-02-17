#!/usr/bin/env raku

# 2023-02-16 GH5209  'sum' replaces all instances of '[+]'

sub MAIN() {

    for (1 .. 9).permutations -> @permutation {

        my @matrix;
        for @permutation.batch(3) -> @row {
            @matrix.push(@row);
        }

        (sum @matrix[0]) == 15 || next;
        (sum @matrix[1]) == 15 || next;
        (sum @matrix[2]) == 15 || next;
        (sum @matrix[*;0]) == 15 || next;
        (sum @matrix[*;1]) == 15 || next;
        (sum @matrix[*;2]) == 15 || next;
        (sum (@matrix[0;0], @matrix[1;1], @matrix[2;2])) == 15 || next;
        (sum (@matrix[0;2], @matrix[1;1], @matrix[2;0])) == 15 || next;

        for 0 ..^ @matrix.elems -> $row {
            say q{[ }, @matrix[$row].join(q{ }), q{ ]};
        }
        last;
    }
}
