#!/usr/bin/env perl
use v5.36;

my @L = sort { $a <=> $b } (19,11,9,7,20,3,17,16,2,14,1);
for (my $pos = 0 ; $pos <= $#L ; $pos++ ) {
    if ( $L[$pos] == $#L - $pos ) {
        print $L[$pos] . "\n";
    }
}

