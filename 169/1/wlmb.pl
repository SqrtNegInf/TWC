#!/usr/bin/env perl

use v5.12;
use warnings;
use Math::Prime::Util qw(primes);
use Math::Cartesian::Product;
my $N=20;
my $low=1;
my @brilliant_numbers;
while(@brilliant_numbers<$N){
    my $primes=primes($low, 10*$low); # generate primes with 1, 2, 3... digits
    $low*=10;
    push @brilliant_numbers,
        sort {$a <=> $b}
            map {$_->[0]*$_->[1]}
                cartesian {$_[0]>=$_[1]} $primes, $primes;
}
say "The first $N brilliant numbers are: ", join " ", @brilliant_numbers[0..$N-1];
