#!/usr/bin/env perl
use v5.36;

sub jump {
    my @N = @_;
    my $current = 0;

    while ( $current < (scalar @N - 1)) {
        $current += $N[$current];
        if ($N[$current] == 0 || $current > scalar @N) {
            return 0;
        }
    }

    return 1;
}

say jump(<1 2 1 2>);
