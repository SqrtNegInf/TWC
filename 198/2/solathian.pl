#!/usr/bin/env perl
use v5.36;
use Math::Prime::Util 'is_prime';  # to import all functions ':all'

primeCount(10);     # 4
primeCount(15);     # 6
primeCount(1);      # 0
primeCount(25);     # 9


sub primeCount($limit)
{
    my @primeList;
    
    for(my $i = 1; $i < $limit; $i++)
    {
        push(@primeList, $i) if(is_prime($i))
    }
    
    if(@primeList > 0)
    {
        say join("","The ", 0+@primeList , " primes which are less than $limit are: ", join(",",@primeList)); 
        return scalar @primeList;    # just for plain simple return
    }
    else
    {
        say "0";
    }

}
