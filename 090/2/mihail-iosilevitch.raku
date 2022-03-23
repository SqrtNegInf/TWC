#!/usr/bin/env raku
use v6;

sub multiply(Int $a, Int $b --> Int) {
	if $b == 1 {
		$a;
	} else {
		multiply($a*2, ($b/2).floor) + ($b %% 2 ?? 0 !! $a);
	}
}
sub MAIN(Int $a = 238, Int $b = 13) {
	say multiply $a, $b;
}
