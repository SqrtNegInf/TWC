#!/usr/bin/env perl
use v5.36.0;

my @A = (13,13,9,1);

#----optimize for brevity:
print [ sort {$b <=> $a} map {//; map 0+$_ ^ 0+$', @A } @A ]->[0];
print "\n";

#---- or optimize for clarity:
my $highest;
for my $a (@A){
for my $b (@A){
    my $xor = 0+$a ^ 0+$b;
    $highest = $xor if not defined $highest
	            or $xor > $highest;
}}
print "$highest\n";
