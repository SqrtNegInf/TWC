#!/usr/bin/env raku

#unit sub MAIN (*@ints where all(@ints) ~~ Int && @ints.elems > 0, :v(:$verbose));
my @ints = (1,2,2,1,1,3);

my @freq = @ints.Bag.values;

#say ": Frequencies: @freq[]" if $verbose;

say @freq.repeated ?? 0 !! 1;
