#!/usr/bin/env perl
use v5.36;

use Algorithm::Knapsack;
use List::Util 'sum';
use Math::Combinatorics;

my $n = 4;

my @aoa = combos ($n, 0);
@aoa = permos (@aoa);
for my $set (@aoa) {
	say join ' ', sort { $a cmp $b } @$set;
}

sub combos {
	my ($tot, $level) = @_;
	my @solutions;
	my @scores;
	my @fs;
	push @scores, ($_) x ($tot / $_) for 1 .. 3;
	my $sack = Algorithm::Knapsack->new (
		capacity => $tot,
		weights  => \@scores,
	);
	$sack->compute;
	my $combos = 0;
	my %seen;
	for my $fit ($sack->solutions) {
		next unless sum (@scores[@$fit]) == $tot;
		my $res = join (' + ', @scores[@$fit]) . " = $tot\n";
		next if $seen{$res};
		$seen{$res} = 1;
		# Count frequencies
		my %freqs;
		$freqs{$_}++ for @scores[@$fit];
		push @fs, [map { $freqs{$_} || 0 } 1 .. 3];
		push @solutions, [@scores[@$fit]];
		$combos++;
	}
	return @fs;
}

sub permos {
	my @sets = @_;
	my @perms;
	for my $combo (@sets) {
		# Permute these indistinguishably
		my $permer = Math::Combinatorics->new (
			count => sum (@$combo),
			data => [1 .. 3],
			frequency => $combo
		);
		while (my @x = $permer->next_string) {
			push @perms, [@x];
		}
	}
	return @perms;
}
