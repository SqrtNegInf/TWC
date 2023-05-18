#!/usr/bin/env perl
use v5.36;

sub factor{
    my($n) = @_;
    my @factors = (1, $n);
    foreach my $j (2..sqrt($n)){
        push @factors, $j if $n % $j == 0;
        push @factors, ($n / $j) if $n % $j == 0 && $j ** 2 != $n;
    }    
    return @factors;  
}

sub first_ten_with_eight{
    my $i = 0;
    my @first_ten;  
    do{
        my @factors = factor($i);
        push @first_ten, $i if @factors == 8;   
        $i++; 
    }while(@first_ten != 10); 
    return @first_ten;
}

MAIN:{
    print join(", ", first_ten_with_eight()) . "\n";   
}  
