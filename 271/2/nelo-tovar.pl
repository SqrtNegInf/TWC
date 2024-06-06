#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ],
    [ 1024, 512, 256, 128, 64 ]
);

sub one_count{
    my $ones = sprintf('%b', shift);
    $ones =~ s/0//g;
    return length($ones);
}

sub sort_by_1_bits {
    my $nums = shift;
    my @sorted = sort { one_count($a) <=> one_count($b) || $a <=> $b } @$nums;

    return \@sorted;
}

for my $elements (@examples) {
    my $sbb = sort_by_1_bits $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', dump(@$sbb);
    say ' ';
}
