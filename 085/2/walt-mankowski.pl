#!/usr/bin/env perl
use v5.36;

my $EPS = 1e-6;
my $n = 125;
my $logn = log($n);
my $res = 0;

for my $i (2..round(sqrt($n))) {
    my $pow = $logn / log($i);
    if (is_whole($pow, $EPS)) {
        $res = 1;
        last;
    }
}

say $res;

sub round($n) {
    return sprintf "%.0f", $n;
}

sub is_whole($n, $eps) {
    return abs($n - round($n)) < $eps;
}
