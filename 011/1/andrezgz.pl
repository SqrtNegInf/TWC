#!/usr/bin/env perl
use v5.36;

my $f = 212;
while ( $f - ($f - 32) * (100-0)/(212-32) ) { $f-- }; #Simple, but effective
print $f;
