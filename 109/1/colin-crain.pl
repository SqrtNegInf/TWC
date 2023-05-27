#!/usr/bin/env perl
use v5.36;

for (1..20, 479001600) {
     printf "C(%d)%*s= %d\n", $_,  3-length, ' ', sum_divisors($_);
}

sub sum_divisors ($n) {
    my $out = 0;
    for (2..sqrt $n) {
        unless ($n % $_) {
            $out += ($n/$_ == $_ ? $_ : $_ + $n/$_) ;
        }
    }
    return $out;
}

