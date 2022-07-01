#!/usr/bin/env perl

use strict;
use warnings;
#use Data::Dumper;

my $max = 10;
my $valor = 1;

my @primes = primeNumbers();
primorialNumbers();

# Function to obtain all the primes numbers <= 100
sub primeNumbers{
    foreach(my $i=2; $i<=100; $i++){
        push(@primes, $i);
        foreach(my $j=2; $j< $i; $j++){
            if ($i%$j == 0){
                pop(@primes);
                last;
            }
        }   
    }
    unshift(@primes, "1");
    return @primes;
}

sub primorialNumbers{
    foreach(my $j=0; $j<=$max-1; $j++){
       $valor = $valor*$primes[$j];
       print "P($j) = $valor\n";
    }
}


