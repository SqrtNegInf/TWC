#!/usr/bin/env perl
use v5.36;

use Math::Utils qw(gcd);
use Math::Prime::Util qw(factor_exp);
use List::Util qw(all);

my $N=20;
my $candidate=1;
my @achilles_numbers;
while(@achilles_numbers<$N){
    my @exponents=map{$_->[1]} factor_exp(++$candidate);
    push @achilles_numbers, $candidate
        if @exponents>1 and (all {$_>1} @exponents) and gcd(@exponents)==1;
}
say "The first $N Achilles numbers are: ", join " ", @achilles_numbers;
