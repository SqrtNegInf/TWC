#!/usr/bin/env perl
use v5.36;

sub check_intervals {
    my $what = shift;

    my @intervals;
    my @result;
    for my $interval (@$what) {
        for my $seen_interval (@intervals) {
            if ( 
            (($interval->[1]> $seen_interval->[0]) and ($interval->[0] <= $seen_interval->[0])) or
            (($interval->[0] < $seen_interval->[1]) and ($interval->[0] >= $seen_interval->[0]))
                ) {
                push @result, $interval;
                last;
            }
        }

        push @intervals, $interval;
    }

    return \@result;
}

use Test::More;
is_deeply(check_intervals([ [1,4], [3,5], [6,8], [12, 13], [3,20] ]), [ [3,5], [3,20] ]);
is_deeply(check_intervals([ [3,4], [5,7], [6,9], [10, 12], [13,15] ]), [ [6,9] ]);
done_testing();
