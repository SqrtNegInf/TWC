#!/usr/bin/env perl
use v5.36;

use List::MoreUtils q/uniq/;
use Math::Prime::Util q/forperm/;;
use Algorithm::Combinatorics q/combinations_with_repetition/;

sub find_numbers{
    my($numbers, $digits, $maximum) = @_;
    my @results; 
    my @combinations = combinations_with_repetition($numbers, $digits);    
    for my $c (@combinations){
        forperm {
            my @p = @{$c}[@_]; 
            my $i = 0;
            my $d = pop @p;
            my $sum = 0;
            while(defined($d)){
                $sum += ($d * (10 ** $i));
                $i++;  
                $d = pop @p;
            }        
            push @results, $sum if($sum < $maximum && length($sum) == $digits); 
        }@{$c};        
    }  
    return uniq sort {$a <=> $b} @results;
}

MAIN:{
    my @results = find_numbers([0,1,2,5], 2, 21); 
    print "@results";
}
