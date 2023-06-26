#!/usr/bin/env raku

sub MAIN(
    @ints = (2, 7, 4, 1, 8, 1)
) {
    my @sorted = @ints.sort({ $^b <=> $^a });

    until @sorted.elems < 2 {
        if @sorted[0] == @sorted[1] {
            @sorted = @sorted.splice(2).sort({ $^b <=> $^a });
        } else {
            my $new = @sorted[0] - @sorted[1];
            @sorted = @sorted.splice(2).push($new).sort({ $^b <=> $^a });
        }
    }

    say @sorted ?? @sorted[0] !! 0;
}
