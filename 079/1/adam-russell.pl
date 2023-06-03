#!/usr/bin/env perl
use v5.36;

sub count_bits{
    my($n) = @_;
    my $total_count_set_bit = 0;
    for my $x (1 .. $n){
        while($x){
            my $b = $x & 1;
            $total_count_set_bit++ if $b;
            $x = $x >> 1;
        }        
    }
    return $total_count_set_bit;
}


MAIN:{
    my $count = count_bits(4);
    print "$count % 1000000007 = " . $count % 1000000007 . "\n";
    $count = count_bits(3);
    print "$count % 1000000007 = " . $count % 1000000007 . "\n";
}
