#!/usr/bin/env raku

my @ints = 3, 1, 2, 2, 2, 1, 3;
my $k = 2;

# my @ints = 1, 2, 3;
# my $k = 1;

my $count = 0;
for ^@ints -> $j {
    for ^$j -> $i {
        next unless @ints[$i] == @ints[$j];
        $count++ if ($j * $i) %% $k;
    }
}

say $count;
