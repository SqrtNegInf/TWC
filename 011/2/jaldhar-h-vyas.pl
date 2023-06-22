#!/usr/bin/env perl
use v5.36;

my $n = 5;

if ($n < 2) {
    usage();
}

for my $i (0 .. $n - 1) {
    for my $j (0 .. $n - 1) {
        print (($j == $i) ? '1 ' : '0 '); 
    }
    print "\n";
}
