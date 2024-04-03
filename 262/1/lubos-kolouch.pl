#!/usr/bin/env perl
use v5.36;


#package Ch1;
use Carp;

sub max_positive_negative {
    my @ints = @_;
    my $positive_count = scalar(grep { $_ > 0 } @ints);
    my $negative_count = scalar(grep { $_ < 0 } @ints);
    return $positive_count > $negative_count ? $positive_count : $negative_count;
}

# Assert tests
say max_positive_negative(-3, 1, 2, -1, 3, -2, 4);
say max_positive_negative(-1, -2, -3, 1);
say max_positive_negative(1, 2);
