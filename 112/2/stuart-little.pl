#!/usr/bin/env perl
use v5.36;

my %memo=(
    1 => [[1,],],
    2 => [[1,1],[2,]]
);

sub memoSteps($n) {
    (! exists $memo{$n}) && do {
	my @prevTot = ((map {my @ar = (1,@{$_}); \@ar} @{memoSteps($n-1)}), (map {my @ar = (2,@{$_}); \@ar} @{memoSteps($n-2)}));
	$memo{$n} = \@prevTot;
    };
    return $memo{$n};
}

my @res = @{memoSteps(5)};
say scalar @res, "\n", "-" x 10;

for (@res) {
    say "@{$_}";
}
