#!/usr/bin/env raku
#
#
#       daylight-robbery.raku
#
#
#
#       © 2022 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN ( *@arr ) ;

die 'not ok - disabled, run-time error: Index out of range. Is: -2, should be in 0..^Inf';

## test data
@arr = (4, 2, 3, 6, 5, 3) if @arr.elems == 0;

say lookahead();

sub lookahead( $pos = -2, $sum is copy = 0) {
    return $sum if $pos > @arr.end;
    $pos >= 0 && $sum += @arr[$pos];
    ( lookahead( $pos + $_, $sum ) for 2, 3 ).max
}


