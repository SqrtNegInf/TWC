#!/usr/bin/env raku

# run <script> <number>

my %memo=(
    1 => [[1,],],
    2 => [[1,1],[2,]]
);

sub memoSteps($n) {
    (%memo{$n}:!exists) && do {
	%memo{$n} = (|memoSteps($n-1).map({ (1,|$_).Array }),|memoSteps($n-2).map({ (2,|$_).Array })).Array;	
    };
    return %memo{$n}.Array;
}

my @res = memoSteps(6);
say @res.elems;

for (@res) {
    .say;
}
