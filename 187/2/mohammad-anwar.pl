#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;
use Algorithm::Combinatorics qw(variations);

is magical_triplets(1, 2, 3, 2), [3, 2, 2], 'Example 1';
is magical_triplets(1, 3, 2),    [],        'Example 2';
is magical_triplets(1, 1, 2, 3), [],        'Example 3';
is magical_triplets(2, 4, 3),    [4, 3, 2], 'Example 4';

done_testing;

#
#
# METHOD

sub magical_triplets(@list) {
    my $triplets = variations([ sort { $b <=> $a } @list ], 3);
    my %entries  = ();
    foreach my $triplet ($triplets->next) {
        my ($x, $y, $z) = @$triplet;
        if (($x + $y > $z) &&
            ($y + $z > $x) &&
            ($x + $z > $y)) {
            $entries{join(":", $x, $y, $z)} = $x + $y + $z;
        }
    }

    return [] unless (keys %entries);

    my $magical = [
        sort { $entries{$b} <=> $entries{$b} } keys %entries
    ];

    return [ split /\:/, $magical->[0] ];
}
