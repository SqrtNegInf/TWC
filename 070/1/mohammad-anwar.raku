#!/usr/bin/env raku

sub MAIN(Str :$S = 'perlandraku', Int :$C = 3, Int :$O = 4) {
    ($S, swap($S, $C, $O)).join(' => ').say;
}

sub swap(Str $string, Int $count, Int $offset) {

    my $length = $string.chars;
    my @array  = $string.comb;
    for 1..$count -> $i {
        my $a = $i % $length;
        my $b = ($i + $offset) % $length;
        (@array[$a], @array[$b]) = (@array[$b], @array[$a]);
    }

    return @array.join('');
}
