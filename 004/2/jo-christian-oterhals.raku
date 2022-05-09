#!/usr/bin/env raku

#my $letters = ( gather for 1..500 { take ('a'..'z').pick } ).BagHash;
my $letters = <c r a t e>.BagHash;

say ([+] $letters.values) ~ " letters matches";

for "words".IO.lines.sort -> $word {
	my $wbh = $word.lc.comb.BagHash;
	if ($wbh (<=) $letters) {
		$letters = $letters (-) $wbh;
		say "\t" ~ $word;
	}
}

say ([+] $letters.values) ~ " letters remains.";
