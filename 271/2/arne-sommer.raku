#!/usr/bin/env raku

#unit sub MAIN (*@ints where @ints.elems > 0, :v(:$verbose));
my @ints = [1024, 512, 256, 128, 64];

die "Non-negative integers only" unless all(@ints) ~~ UInt;

my @binary = @ints.map({ $_.fmt('%b').comb.sum => $_ }).sort({$^a.key <=> $^b.key || $^a.value <=> $^b.value });

#@binary.map({ say ": { $_.value } = { $_.key } one bits" }) if $verbose;

say '(', @binary.map( *.value ).join(", "), ')';

