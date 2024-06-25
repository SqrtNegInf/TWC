#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	["I love Perl",
     "Imaa ovelmaaa erlPmaaaa",                            "Example 1"],
	["Perl and Raku are friends",
     "erlPmaa andmaaa akuRmaaaa aremaaaaa riendsfmaaaaaa", "Example 2"],
	["The Weekly Challenge",
     "heTmaa eeklyWmaaa hallengeCmaaaa",                   "Example 3"],
];

sub goat_latin
{
	my $s = shift;

    my $n = 1;
	my @s;
	for my $w (split / /, $s) {
		unless ($w =~ /^[aeiou]/i) {
			$w = substr($w, 1) . substr($w, 0, 1);
		}
		push @s, $w . 'ma' . ('a' x $n++);
	}
	return join(' ', @s);
}

for (@$cases) {
    is(goat_latin($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;
