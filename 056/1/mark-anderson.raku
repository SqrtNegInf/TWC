#!/usr/bin/env raku

# Usage:   raku ch-1.p6 @N $k
# Example: raku ch-1.p6 2 7 9 2
# Output:  2,1

sub MAIN(@Nin=(2, 7, 9, 2)) {
    my @N = @Nin;
    my $k = @N.pop;

    for @N.keys.combinations: 2 -> ($i, $j) {
        say "$j,$i" if @N[$j] - @N[$i] == $k;
    }
} 
