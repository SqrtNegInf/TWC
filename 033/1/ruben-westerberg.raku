#!/usr/bin/env raku

my %letters;
for '../00-blogs'.IO.lines() {
	for $_.split("",:skip-empty) {
		%letters{$_}++ if /<[a..zA..Z]>/;
	}
}

my $m=max map {chars %letters{$_}}, keys %letters;
for sort keys %letters {
	printf "%s: %"~$m~"s\n", $_, %letters{$_};
}
