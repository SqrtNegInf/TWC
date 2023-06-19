#!/usr/bin/env perl
use v5.36;

sub forward_difference{
    my($order, $numbers) = @_;
    if(!$order || @{$numbers} == 1){
        return $numbers;
    } 
    else{
        my $reduced = [];
        my $previous = $numbers->[0];
        for(my $i = 1; $i < @{$numbers}; $i++){
            push @{$reduced}, $numbers->[$i] - $previous;
            $previous = $numbers->[$i]; 
        }  
        forward_difference($order - 1, $reduced);  
    }  
    
} 


MAIN:{
    my $order = 1;
    my @numbers = (5, 9, 2, 8, 1, 6);
    my $reduced = forward_difference($order, \@numbers);  
    print join(", ", @{$reduced}) . "\n"; 
}
