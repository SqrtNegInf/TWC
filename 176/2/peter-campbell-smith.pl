#!/usr/bin/env perl
use v5.36;

my ($j, $result);

for $j (10 .. 99) {
	$j =~ m|(\d)(\d)|;
	$result .= "$j, " unless (11 * ($1 + $2)) =~ m|[02468]|;
}

$result = substr($result, 0, -2);
say $1 while $result =~ m|(.{0,36})|g;
