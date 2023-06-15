#!/usr/bin/env perl
use v5.36;

my $AoA = [
	[qw( I L O V E Y O U !)],
	[qw( 2 4 0 3 2 0 1 9)],
	[qw( ! ? $ $ % ^ & * @ + -)],
];

my $max = 0;
foreach my $aref ( @{$AoA} ) {
	$max = (scalar(@{$aref}) > $max) ? scalar(@{$aref}) : $max;
}

foreach my $i (0 .. $max-1) {
	my $out;
	foreach my $aref ( @{$AoA} ) {
		$out .= defined($aref->[$i]) ? $aref->[$i] : " ";
	}
	say $out;
}
