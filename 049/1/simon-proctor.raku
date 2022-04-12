#!/usr/bin/env raku

#| find the first multiple of x made of only 1's and 0's
sub MAIN(
    UInt $x = 55
) {
    my @seq = lazy gather {
        my $current = 1;
        loop {
            take $current.base(2);
            $current++;
        }
    }

    @seq.first( * %% $x ).say;
}
