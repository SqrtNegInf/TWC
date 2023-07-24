#!/usr/bin/env raku

sub MAIN(
    @ints = [1, 5, 0, 3, 5]
) {
    my $ops = 0;

    until @ints.all == 0 {
        my $pick = @ints.grep({ $_ != 0 }).min;
        @ints = @ints.map({ $_ == 0 ?? 0 !! $_ - $pick });
        $ops++;
    }

    say $ops;
}
