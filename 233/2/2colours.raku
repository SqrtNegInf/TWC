#!/usr/bin/env raku

my token integer { 0 | '-'? <[1..9]> <[0..9]>* }
subset IntList of Str where /^ '(' <integer>* % ',' ')' $/; # The task didn't specify what a "list of numbers" should be - treating it as a list of integers

  
my @ints = (1,1,2,2,2,3); #$<integer>;
@ints.Bag.classify(*.value, as => *.key)>>.sort(-*).sort(*.key).map({ .value<> Xxx .key }).flat.list.raku.say;
