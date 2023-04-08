#!/usr/bin/env perl
use v5.36.0;
use strict;
use warnings FATAL => 'all';

use Test2::V0 -srand => 1;

ok(IsMonotonicArray(1,2,2,3), 'Test Case 1 Failed.');
ok(!IsMonotonicArray(1,3,2), 'Test Case 2 Failed.');
ok(IsMonotonicArray(6,5,5,4), 'Test Case 2 Failed.');

sub IsMonotonicArray {
    my @array = @_;

    my $array_size = scalar(@array);
    my ($increement, $decreement) = (1, 1);

    for (my $i = 0; $i < $array_size - 1; $i++) {
        $increement = 0 unless $array[$i] >= $array[$i + 1];
        $decreement = 0 unless $array[$i] <= $array[$i + 1];
        return 0 unless $increement || $decreement;
    }

    return 1;
}

done_testing();
