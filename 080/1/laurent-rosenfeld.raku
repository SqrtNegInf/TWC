#!/usr/bin/env raku

my @N = (5, 2, -2, 0);
my @nums = @N.elems > 1 ?? @N !! (5, 2, -2, 0);
my @sorted = @nums.grep(* >= 0).sort({$^a <=> $^b}).squish;
die "No solution with given input!" if @sorted.elems < 1;
my $result;
for 0..@sorted.end-1 -> $i {
    $result = (@sorted[$i] + 1) and last
        if @sorted[$i] + 1 < @sorted[$i+1];
}
say $result.defined ?? $result !! @sorted[*-1] + 1;
