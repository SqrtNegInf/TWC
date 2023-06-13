#!/usr/bin/env perl
use v5.36;

my @men = 1 .. 50; 
while ( @men > 1 ) { push @men, my ($d,) = splice @men, 0, 2 }
print "Survivor: @men";
