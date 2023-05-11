#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
use List::Util qw( sum product );

my @n = (1,3,5,6,9);
say "AM = ", f(am(@n)), ", GM = ", f(gm(@n)), ", HM = ", f(hm(@n));

sub am {
    my(@n) = @_;
    return sum(@n)/scalar(@n);
}

sub gm {
    my(@n) = @_;
    my $base = abs(product(@n));
    my $exp = 1/scalar(@n);
    return $base ** $exp;
}

sub hm {
    my(@n) = @_;
    my @invn = map {1/$_} @n;
    return scalar(@invn)/sum(@invn);
}

sub f {
    my($n) = @_;
    return sprintf("%.1f", $n);
}
