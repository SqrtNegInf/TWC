#!/usr/bin/env raku

sub unequal-triplets(@_) {
    @_.combinations(3).grep(!*.repeated).elems
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (4, 4, 2, 4, 3), output => 3 },
        %{ input => (1, 1, 1, 1, 1), output => 0 },
        %{ input => (4, 7, 1, 10, 7, 4, 1, 1), output => 28 },
    ];

    for @tests {
        unequal-triplets( .<input> ).&is-deeply: .<output>, .<text>;
    }
#}
