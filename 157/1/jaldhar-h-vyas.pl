#!/usr/bin/env perl
use 5.030;
use warnings;
use Math::Round qw/ nearest /;

sub product {
    my ($arr) = @_;
    my $total = 1;

    for my $elem (@{$arr}) {
        $total *= $elem;
    }

    return $total;
}

sub sum {
    my ($arr) = @_;
    my $total = 0;

    for my $elem (@{$arr}) {
        $total += $elem;
    }

    return $total;
}

my @n = (1,3,5,6,9);

my $am = sum(\@n) / scalar @n;
my $gm = nearest(0.1, (abs product(\@n)) ** (-1 / scalar -@n));
my $hm = nearest(0.1, scalar @n / sum([map { 1 / $_; } @n]));

say "AM = $am, GM = $gm, HM = $hm";
