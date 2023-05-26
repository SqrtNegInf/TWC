#!/usr/bin/env perl
use v5.36;

my $N = shift || 12;
say next_same_1bits($N);

sub num_1bits {
    my($n) = @_;
    my $sum = 0;
    map {$sum += $_} split //, sprintf("%b", $n);
    return $sum;
}

sub next_same_1bits {
    my($n) = @_;
    my $num1s = num_1bits($n);
    while (1) {
        $n++;
        return $n if num_1bits($n) == $num1s;
    }
}
