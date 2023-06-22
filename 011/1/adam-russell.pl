#!/usr/bin/env perl
use v5.36;

for my $c (-100 .. 100){
    my $f = ($c * (9/5)) + 32; 
    if($f == $c){ 
        print "°F = °C at $f\n";  
    }  
}
