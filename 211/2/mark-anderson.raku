#!/usr/bin/env raku
use Test;

ok  split-same-avg(1,2,3,4,5,6,7,8); # [1 8] [2 3 4 5 6 7]
nok split-same-avg(1,3);
ok  split-same-avg(3,3,5,5,5,2,2,1); # [2 3 3 5] [1 2 5 5]
nok split-same-avg(5,5,5,2,2,1); 

sub split-same-avg(*@nums)
{
    my $avg = @nums.sum / @nums.elems;

    for (^@nums).combinations(1..@nums.elems div 2) -> @a
    {
        return True if @nums[@a].sum / @nums[@a].elems == $avg
    }

    return False
}
