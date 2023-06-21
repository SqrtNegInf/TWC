#!/usr/bin/env perl
use v5.36;

use Memoize;

my $sequence_size = 20;

memoize('van_ecks');
sub van_ecks {
    my ($n) = @_;

    return 0 if $n <= 1;

    my $previous_value = van_ecks($n-1);

    for (my $i=$n-2; $i >= 0; --$i) {
        if (van_ecks($i) == $previous_value) {
            return ($n-1) - $i;
        }
    }

    return 0;
}

for my $i (0 .. $sequence_size-1) {
    say van_ecks($i);
}
