#!/usr/bin/env perl
use v5.36;

my $ITERS = 100;  #shift or die "Usage: $0 <iterations>";

my $e = 1;
my $denom = 1;
foreach my $i (1 .. $ITERS) {
    $denom *= $i;
    $e += 1/$denom;
}

print "$e\n";
