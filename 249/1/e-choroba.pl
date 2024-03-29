#!/usr/bin/env perl
use v5.36;

sub equal_pairs_count(@ints) {
    my %seen;
    ++$seen{$_} for @ints;
    return [map $seen{$_} % 2 ? return []
                              : ([$_, $_]) x ($seen{$_} / 2),
            keys %seen]
}

sub equal_pairs_odd(@ints) {
    my %odd;
    my @pairs;
    for my $i (@ints) {
        if (exists $odd{$i}) {
            delete $odd{$i};
            push @pairs, [$i, $i];
        } else {
            undef $odd{$i};
        }
    }
    return keys %odd ? [] : \@pairs
}


use Test2::V0 -srand => 1;
plan 2;

my $type = 'count';
*equal_pairs = *equal_pairs_count{CODE};
for (1, 2) {
    subtest $type => sub {
        plan 5;

        is equal_pairs(3, 2, 3, 2, 2, 2),
            bag { item $_ for [2, 2], [2, 2], [3, 3]; },
            'Example 1';

        is equal_pairs(1, 2, 3, 4), [], 'Example 2';


        is equal_pairs(-1, -1, -2, -2),
            bag { item $_ for [-1, -1], [-2, -2]; },
            'Negative numbers';

        is equal_pairs(1, 1, 1, 1, 2, 2, 2, 2),
            bag { item $_ for [1, 1], [1, 1], [2, 2], [2, 2]; },
            'More than once';

        is equal_pairs(1, 1, 1, 1, 2, 2, 2, 2, 1),
            [],
            'More than once odd';
    };

    no warnings 'redefine';
    $type = 'odd';
    *equal_pairs = *equal_pairs_odd{CODE};
}
