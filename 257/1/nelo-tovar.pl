#!/usr/bin/env perl
use v5.28;

use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (
    [ 5, 2, 1, 6 ],
    [ 1, 2, 0, 3 ],
    [ 0, 1 ],
    [ 9, 4, 9, 2 ],
);

sub smaller_than_current {
    my $ints = shift;
    my @smallers;

    foreach my $x (@$ints) {
        my $count = grep {$_ < $x } @$ints;
        push(@smallers, $count)
    }
    
    return \@smallers;
}

for my $elements (@examples) {
    my $stc = smaller_than_current $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', dump(@$stc);
    say ' ';
}
