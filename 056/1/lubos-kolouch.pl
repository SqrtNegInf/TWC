#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

sub get_valid_pairs {
    my ($k, @arr) = @_;

    my $answer;

    for my $i (0 .. scalar @arr - 2) {
        my $j = $i + 1;

        while (($arr[$j] - $arr[$i] < $k) and ($j < scalar @arr -1)) {
            $j++;
        }

        $answer .= "($j,$i)" if $arr[$j] - $arr[$i] == $k;
    }

        return $answer;
}

# TESTS

use Test::More;

is(get_valid_pairs(2, 2, 7, 9), "(2,1)");
is(get_valid_pairs(2, 2, 4, 6), "(1,0)(2,1)");
is(get_valid_pairs(2, 2, 8, 9), undef);
done_testing;
