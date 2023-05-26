#!/usr/bin/env perl
use v5.36;

sub count_bits{
    my($n) = @_;
    my $total_count_set_bit = 0;
    while($n){
        my $b = $n & 1;
        $total_count_set_bit++ if $b;
        $n = $n >> 1;
    }        
    return $total_count_set_bit;
}

sub next_same_bits{
    my($n) = @_; 
    my $number_bits = count_bits($n);  
    {
        my $next = $n + 1;  
        return $next if count_bits($next) == $number_bits;
        $n = $next;
        redo;   
    }       
}    

MAIN:{
    my($N);
    $N = 3;
    print next_same_bits($N) . "\n";   
    $N = 12;
    print next_same_bits($N) . "\n";   
}   
