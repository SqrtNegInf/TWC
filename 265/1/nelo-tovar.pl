#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);
use POSIX qw(ceil);

my @examples = (
    [ 1, 2, 3, 3, 3, 3, 4, 2 ],
    [ 1, 1 ],
    [ 1, 2, 3 ],
);

sub _33_percent_appearance {
    my $nums = shift;
    my $len = scalar @$nums;
    my $percent = ceil($len * 0.33);
    my %frequencies;
    my @candidates;

    $frequencies{$_}++ for (@$nums);

    foreach my $k (keys %frequencies) {
        push @candidates,$k if ($frequencies{$k} >= $percent );
    }


    return (sort {$a<=> $b} @candidates)[0];

}

for my $elements (@examples) {
    my $pa = _33_percent_appearance $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', $pa;
    say ' ';
}
