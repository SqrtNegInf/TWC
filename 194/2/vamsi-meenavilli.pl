#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use List::MoreUtils qw(uniq);

is(frequencyEqualizer('abbc'), 1, 'Test Case 1 Failed.');
is(frequencyEqualizer('xyzyyxz'), 1, 'Test Case 2 Failed.');
is(frequencyEqualizer('xzxz'), 0, 'Test Case 3 Failed.');

sub frequencyEqualizer {
    my ($string) = @_;

    my %frequency_character_map = ();
    $frequency_character_map{$_} += 1 for (split(//, $string));
    my @unique_frequencies = uniq(values(%frequency_character_map));

    return((scalar(@unique_frequencies) == 2 and abs($unique_frequencies[0] - $unique_frequencies[1]) == 1) ? 1 : 0);
}

done_testing();
