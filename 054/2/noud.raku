#!/usr/bin/env raku
# Collatz Conjecture
# Contributed by Ryan Thompson
#
# It is thought that the following sequence will always reach 1:
#
#     $n = $n / 2 when $n is even
#     $n = 3*$n + 1 when $n is odd
#
# For example, if we start at 23, we get the following sequence:
#
# 23 → 70 → 35 → 106 → 53 → 160 → 80 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# Write a function that finds the Collatz sequence for any positive integer.
# Notice how the sequence itself may go far above the original starting number.
#
# Extra Credit
#
# Have your script calculate the sequence length for all starting numbers up to
# 1000000 (1e6), and output the starting number and sequence length for the
# longest 20 sequences.

sub collatz-seq($n) {
    if ($n == 1) {
        [1];
    } elsif ($n % 2 == 0) {
        [$n, |(collatz-seq($n / 2))];
    } else {
        [$n, |(collatz-seq(3 * $n + 1))];
    }
}

say collatz-seq(23);

exit;  # stale hash-table pointer errors... 'cached' not working properly

# Extra Credit

use experimental :cached;  # My favourite Raku feature!

sub collatz-length($n) is cached {
    if ($n == 1) {
        0;
    } elsif ($n % 2 == 0) {
        collatz-length($n / 2) + 1;
    } else {
        collatz-length(3 * $n + 1) + 1;
    }
}

my $collatz-list = Channel.new;
await (1..1e4).map: -> $n {
    start {
        $collatz-list.send((collatz-length($n), $n));
    }
}
$collatz-list.close();

for $collatz-list.list.sort.tail(5) -> ($l, $n) {
    say $n, ' ', $l;
}
