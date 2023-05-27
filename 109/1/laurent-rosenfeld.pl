#!/usr/bin/env perl
use v5.36;

sub chowla {
    my $n = shift;
    return 0 if $n <= 2;
    my @divisors = grep {$n % $_== 0} 2..($n / 2);
    my $sum = 0;
    $sum += $_ for @divisors;
    return $sum;
}
say join ", ", map { chowla $_} 1..20;
