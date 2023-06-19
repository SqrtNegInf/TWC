#!/usr/bin/env perl

use warnings;
use strict;
use experimental qw( signatures );
no warnings 'experimental';

srand 1;

sub arithmetic_subsequence(@ints) {
    goto &arithmetic_subsequence_naive if @ints <= 200;
    goto &arithmetic_subsequence_optimised
}

sub arithmetic_subsequence_naive(@ints) {
    my $max = -1;
    for my $first (0 .. $#ints - 1) {
        for my $second ($first + 1 .. $#ints) {
            my $length = 2;
            my $step = $ints[$second] - $ints[$first];
            my $last = $ints[$second];
            for my $k ($second + 1 .. $#ints) {
                if ($ints[$k] == $last + $step) {
                    $last = $ints[$k];
                    ++$length;
                }
            }
            $max = $length if $length > $max;
        }
    }
    return $max
}

sub arithmetic_subsequence_optimised(@ints) {
    my $max = -1;
    my %tried;
    for my $first (0 .. $#ints - 1) {
        for my $second ($first + 1 .. $#ints) {
            my $length = 2;
            my $step = $ints[$second] - $ints[$first];
            next if exists $tried{$first}{$step};

            undef $tried{$first}{$step};
            next if exists $tried{$second}{$step};

            undef $tried{$second}{$step};
            my $last = $ints[$second];

            for my $k ($second + 1 .. $#ints) {
                if ($ints[$k] == $last + $step) {
                    ++$length;
                    $last = $ints[$k];
                    undef $tried{$k}{$step};
                }
            }
            $max = $length if $length > $max;
        }
    }
    return $max
}

use Test::More tests => 3 + 1;

is arithmetic_subsequence(9, 4, 7, 2, 10), 3, 'Example 1';
is arithmetic_subsequence(3, 6, 9, 12), 4, 'Example 2';
is arithmetic_subsequence(20, 1, 15, 3, 10, 5, 8), 4, 'Example 3';

my @l = map int rand 100, 1 .. 200;
is arithmetic_subsequence_naive(@l),
    arithmetic_subsequence_optimised(@l),
    'same';
