#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	q/{%  id   field1="value1"    field2="value2"  field3=42 %}/,
	q/{%  id   field1="value1"    field2="va \"xxx\" lue2"  field3=42 %}/,
	q/{%   %}/,
];

sub line_parser
{
	my $row = shift;

	my $href = {};
	
	$row =~ /\{%\s*(\w+)/;
	return undef unless $1;

    $href->{name} = $1;
	
	$row =~ s/\\"/\034/g;
	while ($row =~ /([\w\d]+)="?(\d+|[\w\034\s]+)"?/cg) {
		my $f = $1;
		my $v = $2;
        $v =~ s/\034/"/g;
		$href->{fields}->{$f} = $v;
	}

	return $href;
}

is(line_parser($cases->[0]), { name => 'id',
								   fields => {
									   field1 => 'value1',
									   field2 => 'value2',
									   field3 => 42,
								   }
							 }, 'Example 1');
is(line_parser($cases->[1]), { name => 'id',
								   fields => {
									   field1 => 'value1',
									   field2 => 'va "xxx" lue2',
									   field3 => 42,
								   }
							 }, 'Example 2');
is(line_parser($cases->[2]), undef, 'Example 3');
done_testing();

exit 0;

