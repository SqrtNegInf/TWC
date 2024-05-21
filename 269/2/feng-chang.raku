#!/usr/bin/env raku

#unit sub MAIN(*@ints where +@ints ≥ 2);
my @ints = [5, 4, 3, 8];

my (@a, @b);
@a.push(@ints.shift);
@b.push(@ints.shift);
@a[*-1] > @b[*-1] ?? @a.push($_) !! @b.push($_) for @ints;
put "{@a} {@b}";    
