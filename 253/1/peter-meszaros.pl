#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[['one.two.three', 'four.five', 'six'], '.'],
	[['$perl$$', '$$raku$'], '$'],
];

sub split_string
{
	my $list = shift;
	my $sep = shift;

    my $res;
    my $s = "\\$sep";
    for my $l (@$list) {
        $l =~ s/$s/ /g;
        push @$res, split(' ', $l);
    }
    return $res;
}

is(split_string($cases->[0]->@*),
                ['one', 'two', 'three', 'four', 'five', 'six'],
                'Example 1');
is(split_string($cases->[1]->@*),
                 ['perl', 'raku'],
                 'Example 2');
done_testing();
