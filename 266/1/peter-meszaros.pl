#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[['Mango is sweet', 'Mango is sour'],    ['sour', 'sweet'], 'Example 1'],
	[['Mango Mango',    'Orange'],           ['Orange'],        'Example 2'],
	[['Mango is Mango', 'Orange is Orange'], [''],              'Example 3'],
];

sub uncommon_words
{
	my $line1 = $_[0]->[0];
	my $line2 = $_[0]->[1];

	my %h;
	$h{$_}++ for split(/\s+/, $line1), split(/\s+/, $line2);

	my @res = sort grep {$h{$_} == 1} keys %h;
	return @res ? \@res : [''];
}

for (@$cases) {
    is(uncommon_words($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;
