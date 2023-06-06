#!/usr/bin/env perl
use v5.36;

sub factorial{
    my($n) = @_;
    return 1 if $n == 1; 
    return $n * factorial($n - 1); 
}

sub count_10s{
    my($n) = @_;
    return 2 if $n == 10;   
    return 1 if $n >=5 && $n < 10;   
    return 0 if $n < 5;   
} 

MAIN:{
    my $n = 10; 
    my $zeroes = count_10s($n);  
    print "\$N! = " . factorial($n) . " has $zeroes trailing zero\n" if $zeroes == 1; 
    print "\$N! = " . factorial($n) . " has $zeroes trailing zeroes\n" if $zeroes > 1 || $zeroes == 0; 
} 
