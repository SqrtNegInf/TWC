#!/usr/bin/env perl
use v5.36;

use boolean;

sub prime_factor{
    my $x = shift(@_); 
    my @factors;    
    for (my $y = 2; $y <= $x; $y++){
        next if $x % $y;
        $x /= $y;
        push @factors, $y;
        redo;
    }
    return @factors;  
}

sub is_ugly{
    my($x) = @_; 
    for my $factor (prime_factor($x)){
        return false if $factor != 2 && $factor != 3 && $factor !=5; 
    }
    return true; 
}

sub nth_ugly{
    my($n) = @_;  
    return 1 if $n == 1; 
    my $ugly_count = 1; 
    my $i = 1;  
    do{
        $i++;
        $ugly_count++ if is_ugly($i);   
    }while($ugly_count != $n);
    return $i;    
} 

MAIN:{
    my($N);
    $N = 7; 
    print nth_ugly($N) . "\n"; 
    $N = 10; 
    print nth_ugly($N) . "\n"; 
    $N = 150; 
    print nth_ugly($N) . "\n"; 
}   
