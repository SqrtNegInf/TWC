#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	['a1c1e1',   'abcdef'],
	['a1b2c3d4', 'abbdcfdh'],
	['b2b',      'bdb'],
	['a16z',     'abgz'],
	['816z',     undef],
];

sub replace_digits
{
	my $str = shift;

	my @str = split //, $str;
    return undef if $str[0] =~ /\d/;
	my $c = ord($str[0]);
    for my $i (1..$#str) {
		if ($str[$i] =~ /\d/) {
			$str[$i] = chr($c+$str[$i]);
		} else {
			$c = ord($str[$i]);
		}
	}
	return join '', @str;
}

for (@$cases) {
    is(replace_digits($_->[0]), $_->[1], $_->[2]);
}
done_testing();
