#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

my $A = shift(@ARGV) // 1221;
my $B = reverse scalar $A;
my $C = ($A eq $B);

printf "Input: %d\n", $A;
printf "Output: %d%s\n",
       $C,($C ? '' : ", since $A and $B are not the same");
