#!/usr/bin/env raku

sub is_factorion (Int $in) {
    my $sum = [+] map { [*] 1..$_ }, $in.comb;
    return $sum == $in;
}

say 'yes' if is_factorion 40585;
