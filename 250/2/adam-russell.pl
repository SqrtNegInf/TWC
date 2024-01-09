#!/usr/bin/env perl
use v5.36;

sub alphanumeric_string_value{
    my @values = sort {$b <=> $a} map{
        /^\d*$/?0 + $_:length 
    } @_;   
    return $values[0];  
}

MAIN:{
    say alphanumeric_string_value qw/perl 2 000 python r4ku/;   
    say alphanumeric_string_value qw/001 1 000 0001/;   
}
