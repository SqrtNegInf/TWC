#!/usr/bin/env perl5.32.1

use v5.12;
use warnings;
use PDL;
my $count=10;
my $candidate=1;
while($count){
    $candidate+=2; # only test odd numbers
    my $potential_divisors=1+sequence($candidate/2);
    my $divisors=$potential_divisors->where($candidate%$potential_divisors==0);
    my $sum=$divisors->sumover;
    $count--, say "$candidate: Divisors: $divisors. Sum: $sum." if $sum>$candidate;
}
