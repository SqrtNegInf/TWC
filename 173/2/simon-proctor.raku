#!/usr/bin/env raku

sub MAIN( UInt $n = 10 ) {
    my @seq = lazy gather {
        take 2;
        take 3;
        my $accum = 6;
        my $next = 7;
        loop {
            take $next;
            $accum *= $next;
            $next = $accum+1;
        }
    };
    .say for @seq[^$n];
}
