#!/usr/bin/env raku

sub check_triplet(List $elements, List $conditions --> Bool) {
    return $elements[$conditions[0 .. * - 2]].sum == $elements[$conditions[* - 1]];
}

sub special_quadrupel(List $list where $list.elems ≥ 4 --> Int) {
    return grep( -> $x { check_triplet($list, $x) }, $list.keys.combinations(4)).elems;
}

sub MAIN {
    use Test;
    plan 3;
    is special_quadrupel(( 1, 2, 3, 6 )), 1, 'quadruplets one';
    is special_quadrupel(( 1, 1, 1, 3, 5 )), 4, 'quadruplets two';
    is special_quadrupel(( 3, 3, 6, 4, 5 )), 0, 'quadruplets three';
}
