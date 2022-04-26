#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/say/;

sub fwd_diff {
    return map $_[$_] - $_[$_ - 1], 1..$#_;
}

my ($order, @values) = (1, (5, 9, 2, 8, 1, 6));
my $count = scalar @values;
if ($count <= $order) {
    die "Can't calculate ${order}th series of $count values";
}
my @result = @values;
for (1..$order) {
    @result = fwd_diff @result;
}
say "${order} forward diff of @values is: @result";
