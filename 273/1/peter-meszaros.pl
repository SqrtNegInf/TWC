#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	[['perl',      'e'], 25],
	[['java',      'a'], 50],
	[['python',    'm'],  0],
	[['ada',       'a'], 67],
	[['ballerina', 'l'], 22],
	[['analitik',  'k'], 13],
];

sub percentage_of_character
{
	my $str = $_[0]->[0];
	my $chr = $_[0]->[1];

	my $num = () = $str =~ /$chr/gi; 
	return int($num / length($str) * 100.0 + 0.5);
}

for (@$cases) {
    is(percentage_of_character($_->[0]), $_->[1], $_->[2]);
}
done_testing();
