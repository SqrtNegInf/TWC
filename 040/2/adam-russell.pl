#!/usr/bin/env perl
use v5.36;

use Readonly;
Readonly::Array my @A => qw/10 4 1 8 12 3/;
Readonly::Array my @INDICES => qw/0 2 5/;

my @sorted = @A; 
my @sorted_values = sort {$a <=> $b} map {$A[$_]} @INDICES;  
my @sorted_indices = sort {$a <=> $b} @INDICES;
for my $i (@sorted_indices){
    $sorted[$i] = shift @sorted_values;  
}
print join(", ", @sorted) . "\n";  
