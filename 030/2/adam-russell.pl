#!/usr/bin/env perl
use v5.36;

use enum qw<false true>;
use Math::Combinatorics;

sub has_even{
    my @numbers = @_;
    my @evens = grep { $_ % 2 == 0 } @numbers;
    if(@evens){
        return true; 
    }  
    return false; 
}

sub sums_12{
    my @numbers = @_;
    my $sum = unpack("%32I*", pack("I*", @numbers));  
    if($sum == 12){
        return true;
    }
    return false; 
}

MAIN:{
    my $combinations = Math::Combinatorics->new(count => 3,
                                               data  => [-10 .. 10]  
    );
    my @combination = $combinations->next_combination();
    do{
        if(has_even(@combination) and sums_12(@combination)){
            print "@combination\n"; 
        } 
        @combination = $combinations->next_combination();
    } while(@combination);
}  
