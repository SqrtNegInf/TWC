#!/usr/bin/env perl
use v5.36;

sub sum {
    my $sum_digits = 0;
    $sum_digits += $_ for split //, shift;
    return $sum_digits;
}
my ($nb_digits, $sum) = (2,10);
for my $num (10 ** ($nb_digits - 1) .. 10 ** $nb_digits - 1 ) {
    say $num if $sum == sum $num;
}
