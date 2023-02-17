#!/usr/bin/env raku

# 2023-02-16 GH5209

constant $el-count = 7;

sub four-squares(@input where .elems == $el-count --> Array[Map])
{
	my Map @results;
	for @input.permutations -> @case {
		my @sum_groups = (0, |@case, 0).rotor(3 => -1);

		@results.push: %(flat zip 'a' .. 'g', @case)
		    if [==] @sum_groups.map: { sum $_ };
		   #if [==] @sum_groups.map: { [+] $_ };
	}

	return @results;
}

say four-squares 1 .. 7;
