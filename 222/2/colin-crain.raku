#!/usr/bin/env raku
#
#
#       222-2-last-element-standing.raku
#
#
#
#       © 2022 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##


my @arr = (2, 7, 4, 1, 8, 1);

@arr .= sort;

while @arr.elems > 1 {
    $_ = [-] (@arr.splice(*-2).reverse) || next;
    @arr.splice( ((|@arr, $_).first: * >= $_, :k), 0, $_ );     
}

say @arr.defined ?? @arr[0] !! 0;







