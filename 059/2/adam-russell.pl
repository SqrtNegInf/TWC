#!/usr/bin/env perl
use v5.36;

sub count_different_bits{
    my($a, $b) = @_;
    my $bits = 0;
    while($a || $b){
        $bits++ if ($a & 1) && !($b & 1);
        $bits++ if !($a & 1) && ($b & 1);
        $a = $a >> 1;
        $b = $b >> 1;
    }
    return $bits;
}

MAIN:{
    my $sum = 0;
    my $line; 
    while($line = <DATA>){
       chomp($line);
       my($a, $b) = split(/,/, $line);
       my $different_bits = count_different_bits($a, $b);
       print "($a, $b) = $different_bits\n";
       $sum += $different_bits; 
    } 
    print "sum of all bit differences: $sum\n"; 
}

__DATA__
2,3
2,4
3,4
