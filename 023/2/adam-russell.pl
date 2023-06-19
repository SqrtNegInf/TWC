#!/usr/bin/env perl
use v5.36;

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

MAIN:{
    my $n = 228; 
    print join(", ", prime_factor($n)) . "\n"; 
}
