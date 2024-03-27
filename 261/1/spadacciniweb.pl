#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my @ints = (1,2,3,45);
absolute_difference(\@ints);

@ints = (1,12,3);
absolute_difference(\@ints);

@ints = (1,2,3,4);
absolute_difference(\@ints);

@ints = (236, 416, 336, 350);
absolute_difference(\@ints);

exit 0;

sub absolute_difference {
    my $ints = shift;

    my $sum = sum(@$ints);
    my $digit_sum = sum map { split //, $_ }
                          @$ints;
    printf "(%s) -> %s\n",
        (join ',', @$ints),
        abs($digit_sum - $sum);

    return undef;
}
