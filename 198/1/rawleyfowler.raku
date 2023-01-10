#!/usr/bin/env raku

my @vals = (2,5,8,1);

my $max-dist = -1;
my @pairs;
loop (my $i = 0; $i < @vals.elems - 1; $i++) {
    next if @vals[$i] > @vals[$i+1];
    $max-dist = max($max-dist, @vals[$i+1]- @vals[$i]);
    if (@vals[$i+1] - @vals[$i]) == $max-dist {
        @pairs.push: (@vals[$i], @vals[$i+1]);
    }
}

say @pairs.raku;
