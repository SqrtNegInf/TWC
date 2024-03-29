#!/usr/bin/env perl
use v5.36;

my @words= qw<alphabet book carpet cadmium cadeau alpine>;

my @shortest=
map {
	my $prefix;
	for my $i (0..length($_) -1) {
		$prefix= substr $_,0, $i;
		last if 1 == grep {$prefix eq $_}  map { substr $_, 0, $i} @words;
	}
	$prefix;

}
@words;

say join ", ",@shortest;
