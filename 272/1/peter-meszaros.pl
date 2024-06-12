#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	['1.1.1.1',     '1[.]1[.]1[.]1',     'Example 1'],
	['255.101.1.0', '255[.]101[.]1[.]0', 'Example 2'],
];

sub defang_ip_address
{
	my $ip = shift;
	$ip =~ s/\./\[\.\]/g;
	return $ip;
}

for (@$cases) {
    is(defang_ip_address($_->[0]), $_->[1], $_->[2]);
}

done_testing();

exit 0;
