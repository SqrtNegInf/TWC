#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    ['PeRlwEeKLy', 'L', 'Example 1'],
    ['ChaLlenge',  'L', 'Example 2'],
    ['The',        '',  'Example 3'],
];

sub greatest_english_letter
{
    my $w = shift;

    my %h;
    for my $l (split(//, $w)) {
        my $ul = uc $l; 
        $h{$ul} |= (($l eq $ul) ? 1 : 2);
    }

    return (sort grep {$h{$_} == 3} keys %h)[-1] // '';
}

for (@$cases) {
    is(greatest_english_letter($_->[0]), $_->[1], $_->[2]);
}
done_testing();
