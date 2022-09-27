#!/usr/bin/env perl

use v5.36;
use Data::Dumper;
use Test2::V0 -srand => 1;

is unique_array( [1,2], [3,4], [5,6], [1,2] ),
   [ [1,2], [3,4], [5,6] ], 'Example 1';

is unique_array( [9,1], [3,7], [2,5], [2,5] ),
   [ [9, 1], [3,7], [2,5] ], 'Example 2';

done_testing;

#
#
# METHOD

sub unique_array(@list) {
    my $unique = [];
    my %seen   = ();
    foreach my $entry (@list) {
        my $key = join(":", @$entry);
        push @$unique, $entry
            unless (exists $seen{$key});
        $seen{$key} = 1;
    }

    return $unique;
}
