#!/usr/bin/env raku

#unit sub MAIN (Int $k, *@ints where @ints.elems > 0 && all(@ints) ~~ Int, :v(:$verbose));

my @ints = (1, 5, 3, 2, 4, 2);
my $k = 2;

#say ": Sorted: { @ints.sort.join(",") }" if $verbose;

say '(', (@ints.sort.grep: $k, :k).join(", "), ')';
