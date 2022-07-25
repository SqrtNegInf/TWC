#!/usr/bin/env raku

sub isDisarium(Int $n) {
    my @digits = $n.comb;
    my $total = 0;

    for @digits.kv -> $pos, $digit {
        $total += $digit ** ($pos + 1);
    }

    return $total == $n;
}

sub MAIN() {
    my @disariums;
    my $n = 0;

    while @disariums.elems < 18 {
        if isDisarium($n) {
            @disariums.push($n);
        }
        $n++;
    }

    @disariums.join(q{, }).say;
}
