#!/usr/bin/env perl
use v5.36;

sub F{
    my($n) = @_;
    if($n == 0){
        return 1;  
    } 
    return $n - M(F($n - 1));  
}

sub M{ 
    my($n) = @_;
    if($n == 0){
        return 0;  
    }  
    return $n - F(M($n - 1));  
}

##
# Main
## 
for my $n (0 .. 25){  
    print "$n\tM: " . M($n) . "\tF: " . F($n) . "\n";
}   
