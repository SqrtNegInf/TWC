#!/usr/bin/env perl
use v5.36;

use constant NIVEN_COUNT => 50;
my $i = 1;  
my $count = 0;
do{
    my @digits = split(//,$i); 
    my $digit_sum = unpack("%32C*", pack("C*", @digits));   
    if($i % $digit_sum == 0){ 
        print "$i ";  
        $count++;  
    }  
    $i++;   
}while($count < NIVEN_COUNT);
print "\n";   
