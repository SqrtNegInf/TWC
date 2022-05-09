#!/usr/bin/env raku

my Int $lim = 10000;

sub MAIN( Int $limit = 50) {
    hamming($limit).join(', ').say;
}

#| Return Hamming numbers up to the specified $limit
sub hamming( Int $limit ) {
    my @n;
    for 1, 2, 4, 8 … ∞ -> $d2 {
        last if $d2 > $limit;
        for 1, 3, 9, 27 … ∞ -> $d3 {
            last if $d2 * $d3 > $limit;
            for 1, 5, 25, 125 … ∞ -> $d5 {
                my $n = $d2 * $d3 * $d5;
                last if $n > $limit;
                @n.push($n);
            }
        }
    }

    @n.sort;
}
