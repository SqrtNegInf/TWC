#!/usr/bin/env raku
my $wordsFile='words';
my $max=$wordsFile.IO.lines.map({
	.split("")[1..*-2].sort.join;
}).Bag.antipairs.max;
say "$max.value() has $max.key() anagrams";
