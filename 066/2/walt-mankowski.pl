#!/usr/bin/env perl
use v5.36;

my $N = 64;
my $logn = log($N);
my $found = 0;
for my $m (2..sqrt($N)) {
    my $n = $logn / log($m);
    if (is_int($n)) {
        say "$m^$n";
        $found = 1;
    }
}

say 0 unless $found;

sub is_int($n) {
    my $EPS = 1e-10;
    my $round = sprintf "%.0f", $n;
    return abs($round - $n) < $EPS;
}
