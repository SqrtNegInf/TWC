#!/usr/bin/env perl
use v5.36;

use Path::Tiny;

my %rows = map { $_ => 1 } 1..15;
delete $rows{$_} for map { s/,.*$//; $_ } path ('example.txt')->lines ({ chomp => 1});
my ($missing) = keys %rows;
print "Row $missing is missing\n";
