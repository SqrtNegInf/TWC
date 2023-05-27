#!/usr/bin/env perl
use v5.36;

use constant CHOWLA_COUNT => 20;
sub factor{
    my($n) = @_;
    my @factors = ();
    foreach my $j (2..sqrt($n)){
        push @factors, $j if $n % $j == 0;
        push @factors, ($n / $j) if $n % $j == 0 && $j ** 2 != $n;
    }    
    return @factors;  
}

sub chowla{
    my(@factors) = @_;
    my $sum = unpack("%32I*", pack("I*", @factors)); 
}

MAIN:{
    my @chowla_numbers;
    for my $n (1 .. CHOWLA_COUNT){
        push @chowla_numbers, chowla(factor($n));
    }
    print join(", ", @chowla_numbers) . "\n"; 
}
