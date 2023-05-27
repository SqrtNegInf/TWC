#!/usr/bin/env perl
use v5.36;

use Array::Compare;
use Algorithm::Combinatorics q/variations_with_repetition/;

sub steps{
    my($k) = @_; 
    my @data = (0, 1, 2);
    my @steps;  
    my $comparison = Array::Compare->new;
    my $iterator = variations_with_repetition(\@data, $k);
    while(my $combination = $iterator->next()){
        if(unpack("%32C*", pack("C*", @{$combination})) == $k){
            my $step = [grep {$_ != 0} @{$combination}];  
            push @steps, $step if(!grep {$comparison->compare($_, $step)} @steps);  
        }   
    }
    return @steps; 
}

MAIN:{
    my @steps;
    @steps = steps(3);
    print "k = 3\n"; 
    for my $steps (@steps){
        my $option; 
        for my $step (@{$steps}){
            $option .=  "$step step + "  if $step == 1; 
            $option .=  "$step steps + " if $step == 2; 
        }   
        chop($option);  
        chop($option);  
        print "$option\n";   
    }     
    @steps = steps(4);
    print "\nk = 4\n"; 
    for my $steps (@steps){
        my $option; 
        for my $step (@{$steps}){
            $option .=  "$step step + "  if $step == 1; 
            $option .=  "$step steps + " if $step == 2; 
        }   
        chop($option);  
        chop($option);  
        print "$option\n";   
    }     
    @steps = steps(5);
    print "\nk = 5\n"; 
    for my $steps (@steps){
        my $option; 
        for my $step (@{$steps}){
            $option .=  "$step step + "  if $step == 1; 
            $option .=  "$step steps + " if $step == 2; 
        }   
        chop($option);  
        chop($option);  
        print "$option\n";   
    }     
}
