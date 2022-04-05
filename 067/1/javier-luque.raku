#!/usr/bin/env raku

multi MAIN() { MAIN(5, 3); }

multi MAIN(Int $m, Int $n) {
	my @data = (1 .. $m);
	say @data.combinations: $n;
}
