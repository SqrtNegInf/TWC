#!/usr/bin/env raku

#unit sub MAIN ($sentence1, $sentence2, :v(:$verbose));
my $sentence1 = 'my red dog is blue';
my $sentence2 = 'blue sky is bad';

my @words1 = $sentence1.words;
my @words2 = $sentence2.words;

my $once1  = (@words1.Bag.grep: *.value == 1).Bag;
my $once2  = (@words2.Bag.grep: *.value == 1).Bag;

my $common = $once1 (&) $once2;

say $common.elems;
