#!/usr/bin/env raku

use Test;

is disarium-numbers(18),
   [ 0,1,2,3,4,5,6,7,8,9,89,135,175,518,598,1306,1676,2427 ];

done-testing;

#
#
# METHODS

sub is-disarium-number(Int $n where $n >= 0 --> Bool) {
    my @n = $n.comb;
    my $s = 0;
    $s += @n[$_] ** ($_ + 1) for 0 .. @n.elems - 1;

    return ($s == $n);
}

sub disarium-numbers(Int $n where $n > 0) {
    my $i  = 0;
    my $dn = [];
    while $dn.elems < $n {
        $dn.push: $i if is-disarium-number $i;
        $i++;
    }

    return $dn;
}
