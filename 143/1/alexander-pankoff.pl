#!/usr/bin/env perl
use strict;
use warnings;

my $expr = '3*2+2'; #$ARGV[0];
die "invalid expr\n" unless $expr && $expr =~ m/^[\s\d\.\+\-\*\(\)]*$/;
print eval($expr) . "\n";
