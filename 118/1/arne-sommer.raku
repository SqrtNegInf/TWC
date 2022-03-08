#!/usr/bin/env raku

#unit sub MAIN (Int $N where $N > 0 = 100, :v($verbose));

for ^100 -> $N {
my $bin = $N.fmt('%b');
#say ": $bin (binary)\n: { $bin.flip } (binary flipped)" if $verbose;
say $N if + ($bin eq $bin.flip);
}
