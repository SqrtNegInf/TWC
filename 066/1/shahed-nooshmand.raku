#!/usr/bin/env raku

sub MAIN(Int $M = 11, Int $N = 3) {
    die "Error: division by zero" unless $N;
    my $m = abs $M;
    my $n = abs $N;
    my $d = 0;
    ++$d while ($m -= $n) ≥ 0;
    say ($M < 0 xor $N < 0) ?? -$d - 1 !! $d;
}
