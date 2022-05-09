#!/usr/bin/env raku

#my $lettersFile=@*ARGS[0];
my $wordsFile='words';
my %letters= 'crate'.comb.Bag; #$lettersFile.IO.slurp.trim.split("")[1..*-2].Bag.hash;
my %words = $wordsFile.IO.lines.map({$_ => .comb.Bag});
say sort (%words.map: {
	my @keys= .value.keys;
	quietly my @result= ($_.value{@keys}) Z<= (%letters{@keys});
	.key if so all @result;
});
