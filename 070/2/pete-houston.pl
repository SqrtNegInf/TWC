#!/usr/bin/env perl
use v5.36;

$"    = ', ';
my $i  = 2;
my @gc = (0, 1, 3, 2);
my $n  = 4;

while ($i < $n) {
    push @gc, map {$_ + 2**$i} reverse @gc;
    $i++;
}
print "$n-bit Gray code is @gc\n";


