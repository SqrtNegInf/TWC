#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

sub inner_length {
	local $_ = shift;

	# Split the string into words, pick all between the first and the
	# last, join them and return the length.
	length join '', splice @{[split qr{\s+}]}, 1, -1;

}

is inner_length('The Weekly Challenge'), 6, 'Example 1';
is inner_length('The purpose of our lives is to be happy'), 23, 'Example 2';
is inner_length('nothing intermediate'), 0, 'Out of scope: no inner words';
is inner_length('Markmið lífs okkar er að vera hamingjusöm'), 17, 'multi-byte dealt with correctly';

done_testing;
