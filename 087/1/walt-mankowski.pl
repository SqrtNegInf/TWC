#!/usr/bin/env perl
use v5.36;

my @n = sort {$a <=> $b} my @N = (100, 4, 50, 3, 2);

my $best_start = 0;
my $best_run = 0;
my $start = -1;

for my $i (1..$#n) {
    # are we in a run?
    if ($n[$i] == $n[$i-1] + 1) {
        # is this the start of a run?
        $start = $i-1 if $start == -1;

        # do we have a new best run?
        if ($i - $start > $best_run) {
            $best_run = $i - $start;
            $best_start = $start;
        }

    } else {
        # we're not in a run
        $start = -1;
    }
}

if ($best_run > 0) {
    say "@n[$best_start..$best_start+$best_run]";
} else {
    say 0;
}
