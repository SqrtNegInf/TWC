#!/usr/bin/env perl
use v5.36;

my @ints = (-3, 1, 2, -1, 3, -2, 4);
maximum_of_positive_and_negative(\@ints);

@ints = (-1, -2, -3, 1);
maximum_of_positive_and_negative(\@ints);

@ints = (1,2);
maximum_of_positive_and_negative(\@ints);

exit 0;

sub maximum_of_positive_and_negative {
    my $ints = shift;

    my $positive = scalar map { $_ > 0 ? 1 : () }
                            @$ints;
    my $negative = scalar map { $_ < 0 ? 1 : () }
                            @$ints;
    printf "(%s) -> %s\n",
        (join ',', @$ints),
        $positive > $negative ? $positive : $negative;

    return undef;
}
