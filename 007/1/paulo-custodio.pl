#!/usr/bin/env perl
use v5.36;

sub solve {
    my($max) = @_;
    for my $n (1..$max) {
        my $sum = sum(split //, $n);
        say $n if $n % $sum == 0;
    }
}

sub sum {
    my($sum, @a) = @_;
    $sum += $_ for @a;
    return $sum;
}


my $max = shift || 50;
solve($max);
