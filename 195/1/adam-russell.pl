#!/usr/bin/env perl

use v5.36;

use boolean;  
sub is_special{
    my($x) = @_;
    my %h; 
    my @digits = split(//, $x);
    map{ $h{$_} = undef } @digits; 
    return keys %h == @digits; 
}

MAIN:{
    say q// . grep{ is_special($_) } 1 .. 1000;  
}
