#!/usr/bin/env perl
use v5.36;

sub chowla {
    my ($n) = @_;
    my $sum = 0;
 
    for my $i (2 .. $n / 2) {
        if ($n % $i == 0) {
            $sum += $i;
        }
    }
 
    return $sum;
}

my @numbers;

for my $n (1 .. 20) {
    push @numbers, chowla($n);
}

say join q{, }, @numbers;
