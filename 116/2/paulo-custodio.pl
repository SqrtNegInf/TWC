#!/usr/bin/env perl
use v5.36;

my $N = shift || 34;
say sum_of_squares_is_perfect_square($N) ? 1 : 0;

sub sum_of_squares_is_perfect_square {
    my($num) = @_;
    return 0 if $num < 10;
    my $sum = 0;
    for my $digit (split(//, $num)) {
        $sum += $digit*$digit;
    }
    my $sqrt_int = int(sqrt($sum));
    return $sqrt_int*$sqrt_int==$sum;
}
