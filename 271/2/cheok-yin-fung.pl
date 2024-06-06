#!/usr/bin/env perl
use v5.36;

sub sbob {
    my @arr = $_[0]->@*;
    @arr = sort {num_of_one_bits($a)<=>num_of_one_bits($b) || $a<=>$b} @arr;
    return [@arr];
}

sub num_of_one_bits {
    my $num = $_[0];
    my $str = unpack("B32", pack("N", $num));
    my $ones = grep {$_==1} split "", $str;
    return $ones;
}

say join ", ", sbob([0, 1, 2, 3, 4, 5, 6, 7, 8])->@*;
say join ", ", sbob([1024, 512, 256, 128, 64])->@*;
