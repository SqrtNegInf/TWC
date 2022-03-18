#!/usr/bin/env raku

subset Binstr of Str where /^<[01]>*$/;

sub MAIN (Binstr $in-string = '101100101',  Int $size = 4) {
    my $sub-str-len = $in-string.chars / $size;
    my $flips = 0;
    for 0..^$sub-str-len -> $i {
        my $ones = 0;
        for 0..^$size -> $j {
            my $idx = $j * $sub-str-len + $i;
            $ones++ if substr($in-string, $idx, 1) == 1
        }
        my $zeroes = $size - $ones;
        $flips += min ($zeroes, $ones)
    }
    say $flips;
}
