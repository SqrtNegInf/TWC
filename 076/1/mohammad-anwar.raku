#!/usr/bin/env raku

# 2023-02-16 GH5209

sub MAIN(Int $SUM where $SUM > 0 = 51) {
    prime-sum($SUM).join("\n").say;
}

sub prime-sum(Int $sum) {

    my @prime = find-prime-upto($sum);
    my @prime-sum = Empty;
    for 1..$sum -> $i {
        for @prime.combinations: $i -> $j {
            my $_sum = sum $j;
           #my $_sum = [+] $j;
            @prime-sum.push: $j if $_sum == $sum;
        }
    }

    return @prime-sum;
}

sub find-prime-upto(Int $sum) {
    return (2..$sum).grep: { .is-prime };
}
