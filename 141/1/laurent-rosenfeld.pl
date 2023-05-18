#!/usr/bin/env perl
use v5.36;

sub has_8_divisors {
    my $n = shift;
    my @divisors = grep {$n % $_ == 0} 1..$n;
    return @divisors == 8;
}

my $count = 0;
for my $m (8..1_000_000) {
    say $m and $count++ if has_8_divisors $m;
    last if $count >= 10;
}
