#!/usr/bin/env raku
sub MAIN( UInt $k=2, @N = (2, 7, 9))
{
    CATCH { say $*USAGE and exit -1; }

    .say for ( @N>>.UInt )
        .pairs
        .combinations(2)
        .grep( -> $tupel { $tupel[1].value - $tupel[0].value == $k } )
        .map(  -> $tupel { $tupel>>.key } )
    ;
}
