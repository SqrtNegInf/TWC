#!/usr/bin/env raku

# 2023-02-16 GH5209

sub MAIN(Int :$N where $N > 0= 377) {
    fibonacci-sum($N).join("\n").say;
}

#
#
# METHODS

sub fibonacci-sum(Int $sum where $sum > 0) {

    my @fibonacci     = fibonacci-series-upto($sum);
    my @fibonacci_sum = Empty;
    for 1 .. $sum -> $i {
        last if $i > @fibonacci.elems;
        for @fibonacci.combinations: $i -> $comb {
            my $_sum = sum $comb;
           #my $_sum = [+] $comb;
            @fibonacci_sum.push: $comb if $_sum == $sum;
        }
    }

    return |@fibonacci_sum;
}

sub fibonacci-series-upto(Int $num where $num > 0) {

    my @fibonacci = (1, 2);
    while @fibonacci.[*-1] + @fibonacci.[*-2] <= $num {
        @fibonacci.push: @fibonacci.[*-1] + @fibonacci.[*-2];
    }

    return @fibonacci;
}
