#!/usr/bin/env raku

use Test;

is primorial-numbers(10),
   [2, 6, 30, 210, 2310, 30030, 510510, 9699690, 223092870, 6469693230];

done-testing;

#
#
# METHOD

sub primorial-numbers(Int $n) {
    my $pn = [];
    my $i  = 0;
    my $j  = 1;
    while ($pn.elems < $n) {
        $i++;
        next unless $i.is-prime;
        $j = $i * $j;
        $pn.push: $j;
    }

    return $pn;
}
