#!/usr/bin/env perl
use v5.36;

my @N = (2, 7, 9);
my $k = 2;

foreach my $i (reverse(1..$#N)){
    foreach my $j (reverse(0..$i-1)){
        my $difference = $N[$i] - $N[$j];
        if ($difference  == $k){
            print "Output : $i,$j\n";
        }
    }
}
