#!/usr/bin/env raku
# with help from https://www.geeksforgeeks.org/minimum-number-of-primes-required-such-that-their-sum-is-equal-to-n/

sub MAIN(UInt $N where $N > 1 = 51) {
    given $N {
        when .is-prime {
            say $N;
        }
        when * %% 2 {
            .say for min-primes($N, 2);
        }
        default {
            if ($N-2).is-prime {
                .say for min-primes($N, 2);
            }
            else {
                .say for min-primes($N, 3);
            }
        }
    }
}

sub min-primes(UInt $N, $count) {
    my @primes = ((2..$N).grep(*.is-prime) xx $count).flat;

    my @results = @primes.combinations($count).grep(*.sum == $N)
                                              .map(*.sort)
                                              .unique(with => &[eq]);

    my @fmt = map { "%{ @results.map(*[$_]).max.chars }d" }, ^$count;

    return @results.map({sprintf(@fmt, $_.Array)});
}
