#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

say '1,2,3,4,9,10,14,15,16' =~ s{
    ( \b \d+   )
    ( ,? \d+ , )+
    (    \d++  )
    (??{
        # this block is treated as a pattern
        # != will return '' (match) or 1 (fail, because \d++ will swallow all)
        # sum( eval $& ) will work too (;
        ( $3 - $1 + 1 ) * ( $1 + $3 ) / 2 != ( sum( split ',', $& ) || -1 );
    })
}
{$1-$3}xgr;
