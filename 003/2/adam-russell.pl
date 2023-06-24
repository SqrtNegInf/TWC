#!/usr/bin/env perl
use v5.36;

sub compute_entry{
    my($row, $column) = @_;
    unless($row < 2){
        my($x0, $y0, $x1, $y1);  
        $x0 = factorial($row - 1);  
        $y0 = factorial($column - 1) * factorial(($row - 1) - ($column - 1));             
        $x1 = factorial($row - 1);  
        $y1 = factorial($column) * factorial(($row - 1) - $column); 
        return int($x0 / $y0) + int($x1 / $y1);   
    } 
    return 1;   
} 

sub factorial{
    my($n) = @_;
    unless($n < 1){
        return $n * factorial($n - 1); 
    }
    return 1;  
}

##
# Main    
##  
my $max = 10;  
my $padding = " ";
my $padding_length = $max;  
for my $i (1 .. $max){
    $padding_length = $padding_length - 1;  
    print $padding x $padding_length;  
    for my $j (1 .. $i){
        print compute_entry($i - 1, $j - 1) . " ";  
    } 
    print "\n";       
} 
