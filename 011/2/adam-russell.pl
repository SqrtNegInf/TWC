#!/usr/bin/env perl
use v5.36;

use constant SIZE => 5;

my @a;
for my $i (0 .. SIZE - 1){
    my @b = (0) x SIZE;
    $b[$i] = 1;
    push @a, \@b; 
}
print SIZE . " x " . SIZE . " identity matrix:\n";  
for my $i (0 .. SIZE - 1){
    print "\t" . join(" ", @{$a[$i]}) . "\n"; 
}  
