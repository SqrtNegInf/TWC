#!/usr/bin/env raku


sub MAIN (
    UInt $count= 100, #= Amount of sequence to generate
    UInt $start = 0 # Value to start sequnce from
) {

    my @van-ecks = lazy gather {
        take $start;
        my $n = 0;
        loop {
            if any( @van-ecks[^$n] ) == @van-ecks[$n] {
                my $m;
                for @van-ecks[^$n].kv.reverse -> $v, $k {
                    if $v == @van-ecks[$n] {
                        $m = $k;
                        last;
                    }
                }
                take $n - $m;
            } else {
                take 0;
            }
            $n++;
        }
    }

    say @van-ecks[0..^$count].join(",");

}
