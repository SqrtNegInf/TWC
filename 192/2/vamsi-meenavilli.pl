#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/sum uniq/;
use Test2::V0 -srand => 1;

is(equalDistribution([1, 0, 5]), 4, 'Example 1');
is(equalDistribution([0, 2, 0]), -1, 'Example 2');
is(equalDistribution([0, 3, 0]), 2, 'Example 3');

sub equalDistribution {
    my ($numbers_list) = @_;

    my $number_list_size = scalar(@$numbers_list);
    my $moves = 0;

    if (sum(@$numbers_list) % $number_list_size == 0) {
        while (scalar(uniq @$numbers_list) != 1) {
            my ($max_number_index) = getMaxNumberIndex($numbers_list, $number_list_size);
            my $before_max_number_index = $max_number_index - 1;
            my $after_max_number_index = $max_number_index + 1;

            if (
                $after_max_number_index >= $number_list_size
                || $numbers_list->[$before_max_number_index] <= $numbers_list->[$after_max_number_index]
            ) {
                $numbers_list->[$before_max_number_index] += 1;
            }
            else {
                $numbers_list->[$after_max_number_index] += 1
            }

            $numbers_list->[$max_number_index] -= 1;
            $moves += 1;
        }
    }
    else {
        $moves = -1;
    }

    return($moves);
}

sub getMaxNumberIndex {
    my ($numbers_list, $numbers_list_size) = @_;

    my ($max_number, $max_number_index) = (0, 0);

    for (my $i = 0; $i < $numbers_list_size; $i++) {
        if ($numbers_list->[$i] > $max_number) {
            $max_number = $numbers_list->[$i];
            $max_number_index = $i;
        }
    }

    return($max_number_index);
}

done_testing();
