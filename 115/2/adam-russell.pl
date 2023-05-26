#!/usr/bin/env perl
use v5.36;

sub largest_multiple_2{
    my @numbers = @_;
    return unless grep { $_ % 2 == 0 } @numbers;  
    my @sorted = sort {$b <=> $a} @numbers;
    if(@sorted >= 2){
        my $ultima = @sorted[@sorted - 1];          
        if($ultima % 2 != 0){
            my $swap_index = -1; 
            for(my $i = @sorted - 2; $i >= 0; $i--){
                $swap_index = $i if $sorted[$i] % 2 == 0;   
                last if $swap_index > 0; 
            } 
            $sorted[@sorted - 1] = $sorted[$swap_index];  
            $sorted[$swap_index] = $ultima;  
        }  
    }  
    return join("", @sorted); 
}

MAIN:{
    my @N;
    @N = (1, 0, 2, 6);
    print largest_multiple_2(@N) . "\n"; 
    @N = (1, 4, 2, 8);
    print largest_multiple_2(@N) . "\n"; 
    @N = (4, 1, 7, 6);
    print largest_multiple_2(@N) . "\n"; 
} 
